import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'mediaitem_converter.dart';
import 'page_manager.dart';
import 'service_locator.dart';

DateTime playerTapTime = DateTime.now();
bool get isProcessForPlay {
  return DateTime.now().difference(playerTapTime).inMilliseconds > 600;
}

Timer? debounce;

void playerPlayProcessDebounce(List songsList, int index) {
  debounce?.cancel();
  debounce = Timer(const Duration(milliseconds: 600), () {
    PlayerInvoke.init(songsList: songsList, index: index);
  });
}

class PlayerInvoke {
  static final pageManager = getIt<PageManager>();

  static Future<void> init({
    required List songsList,
    required int index,
    bool fromMiniPlayer = false,
    bool shuffle = false,
    String? playlistBox,
  }) async {
    final int globalIndex = index < 0 ? 0 : index;
    final List finalList = songsList.toList();
    if (shuffle) finalList.shuffle();

    if (!fromMiniPlayer) {
      if (!Platform.isAndroid) {
        await pageManager.stop();
      }

      await setValues(finalList, globalIndex);
    }
  }

  static Future<void> setValues(List arr, int index,
      {recommend = false}) async {
    final List<MediaItem> queue = [];
    final Map playItem = arr[index] as Map;
    final Map? nextItem =
        index == arr.length - 1 ? null : arr[index + 1] as Map;

    // Check and update YouTube URLs for all items in arr
    for (int i = 0; i < arr.length; i++) {
      Map song = Map.from(arr[i]);
      String? url = song['url']?.toString();
      if (url != null &&
          (url.contains('youtube.com') || url.contains('youtu.be'))) {
        String? audioUrl = await getYouTubeAudioStreamUrl(url);
        if (audioUrl != null) {
          song['url'] = audioUrl;
        }
      }
      queue.add(
          await MediaItemConverter.mapToMediaItem(song, autoplay: recommend));
    }

    await updateNPlay(queue, index);
  }

  static Future<void> updateNPlay(List<MediaItem> queue, int index) async {
    try {
      await pageManager.setShuffleMode(AudioServiceShuffleMode.none);
      await pageManager.adds(queue, index);
      await pageManager.playAS();
    } catch (e) {
      if (kDebugMode) {
        print("error: $e");
      }
    }
  }
}
