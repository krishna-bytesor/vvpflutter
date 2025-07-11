import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'audio_handler.dart';
import 'service_locator.dart';

enum ButtonState {
  paused,
  playing,
  loading,
}

class PlayButtonNotifier extends ValueNotifier<ButtonState> {
  PlayButtonNotifier() : super(_initialValue);
  static const _initialValue = ButtonState.paused;
}

class ProgressBarState {
  final Duration current;
  final Duration buffered;
  final Duration total;

  ProgressBarState(
      {required this.current, required this.buffered, required this.total});
}

class ProgressNotifier extends ValueNotifier<ProgressBarState> {
  ProgressNotifier() : super(_initialValue);
  static final _initialValue = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );
}

enum RepeatState {
  off,
  repeatSong,
  repeatPlaylist,
}

class RepeatButtonNotifier extends ValueNotifier<RepeatState> {
  RepeatButtonNotifier() : super(_initialValue);

  static const _initialValue = RepeatState.off;

  void nextState() {
    final next = (value.index + 1) % RepeatState.values.length;
    value = RepeatState.values[next];
  }
}

class PageManager {
  final currentSongNotifier = ValueNotifier<MediaItem?>(null);
  final playbackStatNotifier =
      ValueNotifier<AudioProcessingState>(AudioProcessingState.idle);
  final playlistNotifier = ValueNotifier<List<MediaItem>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final playButtonNotifier = PlayButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  final audioHandler = getIt<AudioHandler>();

  // New flag to lock UI in loading state
  bool isLoadingNewAudio = false;
  void setLoadingNewAudio(bool value) {
    isLoadingNewAudio = value;
  }

  void init() async {
    listenToChangeInPlaylist();
    listenToPlayBackState();
    listenToCurrentPosition();
    listenToBufferedPosition();
    listenToTotalPosition();
    listenToChangesInSong();
  }

  void listenToChangeInPlaylist() {
    audioHandler.queue.listen((playlist) {
      if (playlist.isEmpty) {
        playlistNotifier.value = [];
        currentSongNotifier.value = null;
      } else {
        playlistNotifier.value = playlist;
      }
      updateSkipButton();
    });
  }

  updateSkipButton() {
    final mediaItem = audioHandler.mediaItem.value;
    final playlist = audioHandler.queue.value;
    if (playlist.length < 2 || mediaItem == null) {
      isFirstSongNotifier.value = true;
      isLastSongNotifier.value = true;
    } else {
      isFirstSongNotifier.value = playlist.first == mediaItem;
      isLastSongNotifier.value = playlist.last == mediaItem;
    }
  }

  void listenToPlayBackState() {
    audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      playbackStatNotifier.value = processingState;
      // If loading new audio, force loading state until actually playing
      if (isLoadingNewAudio) {
        if (processingState == AudioProcessingState.ready && isPlaying) {
          isLoadingNewAudio = false;
          playButtonNotifier.value = ButtonState.playing;
        } else {
          playButtonNotifier.value = ButtonState.loading;
        }
        return;
      }
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        audioHandler.seek(Duration.zero);
        audioHandler.pause();
      }
    });
  }

  listenToCurrentPosition() {
    AudioService.position.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: position,
          buffered: oldState.buffered,
          total: oldState.total);
    });
  }

  listenToBufferedPosition() {
    audioHandler.playbackState.listen((playbackState) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: playbackState.bufferedPosition,
          total: oldState.total);
    });
  }

  listenToTotalPosition() {
    audioHandler.mediaItem.listen((mediaItem) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: oldState.buffered,
          total: mediaItem?.duration ?? Duration.zero);
    });
  }

  listenToChangesInSong() {
    audioHandler.mediaItem.listen((mediaItem) {
      currentSongNotifier.value = mediaItem;
      updateSkipButton();
    });
  }

  Future<void> play() async => await audioHandler.play();
  Future<void> pause() async => await audioHandler.pause();
  void seek(Duration position) => audioHandler.seek(position);
  void previous() => audioHandler.skipToPrevious();
  void next() => audioHandler.skipToNext();

  void seekForward10Seconds() {
    final currentPosition = progressNotifier.value.current;
    final totalDuration = progressNotifier.value.total;
    final newPosition = currentPosition + const Duration(seconds: 10);

    // Ensure we don't seek past the end of the audio
    if (newPosition < totalDuration) {
      seek(newPosition);
    } else {
      seek(totalDuration);
    }
  }

  void seekBackward10Seconds() {
    final currentPosition = progressNotifier.value.current;
    final newPosition = currentPosition - const Duration(seconds: 10);

    // Ensure we don't seek before the start of the audio
    if (newPosition > Duration.zero) {
      seek(newPosition);
    } else {
      seek(Duration.zero);
    }
  }

  Future<void> playAS() async {
    return await audioHandler.play();
  }

  Future<void> updateQueue(List<MediaItem> queue) async {
    return await audioHandler.updateQueue(queue);
  }

  Future<void> updateMediaItem(MediaItem mediaItem) async {
    return await audioHandler.updateMediaItem(mediaItem);
  }

  Future<void> moveMediaItem(int currentIndex, int newIndex) async {
    return await (audioHandler as AudioPlayerHandler)
        .moveQueueItem(currentIndex, newIndex);
  }

  Future<void> removeQueueItemAt(int index) async {
    return await (audioHandler as AudioPlayerHandler)
        .removeQueueItemIndex(index);
  }

  Future<void> customAction(String name) async {
    return await audioHandler.customAction(name);
  }

  Future<void> skipToQueueItem(int index) async {
    return await audioHandler.skipToQueueItem(index);
  }

  void repeat() {
    repeatButtonNotifier.nextState();
    final repeatMode = repeatButtonNotifier.value;
    switch (repeatMode) {
      case RepeatState.off:
        audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
        break;
      case RepeatState.repeatSong:
        audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
        break;
      case RepeatState.repeatPlaylist:
        audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
        break;
    }
  }

  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    switch (repeatMode) {
      case AudioServiceRepeatMode.none:
        repeatButtonNotifier.value = RepeatState.off;
        break;
      case AudioServiceRepeatMode.one:
        repeatButtonNotifier.value = RepeatState.repeatSong;
        break;
      case AudioServiceRepeatMode.group:
        break;
      case AudioServiceRepeatMode.all:
        repeatButtonNotifier.value = RepeatState.repeatPlaylist;
        break;
    }
    audioHandler.setRepeatMode(repeatMode);
  }

  void shuffle() async {
    final enable = !isShuffleModeEnabledNotifier.value;
    isShuffleModeEnabledNotifier.value = enable;
    if (enable) {
      audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
    } else {
      audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
    }
  }

  Future<void> setShuffleMode(AudioServiceShuffleMode value) async {
    isShuffleModeEnabledNotifier.value = value == AudioServiceShuffleMode.all;
    return audioHandler.setShuffleMode(value);
  }

  Future<void> add(MediaItem mediaItem) async {
    audioHandler.addQueueItem(mediaItem);
  }

  Future<void> adds(List<MediaItem> mediaItems, int index,
      {bool autoplay = true}) async {
    if (mediaItems.isEmpty) {
      return;
    }
    await (audioHandler as MyAudioHandler)
        .setNewPlaylist(mediaItems, index, autoplay: autoplay);
  }

  void remove() {
    final lastIndex = audioHandler.queue.value.length - 1;
    if (lastIndex < 0) return;
    audioHandler.removeQueueItemAt(lastIndex);
  }

  Future<void> removeAll() async {
    final lastIndex = audioHandler.queue.value.length - 1;
    if (lastIndex < 0) return;
    audioHandler.removeQueueItemAt(lastIndex);
  }

  void dispose() {
    audioHandler.customAction('dispose');
  }

  Future<void> stop() async {
    await audioHandler.stop();
    await audioHandler.seek(Duration.zero);
    currentSongNotifier.value = null;
    await removeAll();
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
