// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

class MusicBloc extends StatefulWidget {
  const MusicBloc({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<MusicBloc> createState() => _MusicBlocState();
}

class _MusicBlocState extends State<MusicBloc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// AUDIO EVENT DEFINED
abstract class AudioEvent {}

class PlayAudio extends AudioEvent {
  final String url;
  PlayAudio(this.url);
}

class PauseAudio extends AudioEvent {}

class AudioProgressChanged extends AudioEvent {
  final Duration position;
  AudioProgressChanged(this.position);
}

class AudioCompleted extends AudioEvent {}

// AUDIO STATE

abstract class AudioState {}

class AudioInitial extends AudioState {}

class AudioPlaying extends AudioState {
  final Duration position;
  final Duration duration;

  AudioPlaying({required this.position, required this.duration});
}

class AudioPaused extends AudioState {
  final Duration position;
  final Duration duration;

  AudioPaused({required this.position, required this.duration});
}

//

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioBloc() : super(AudioInitial()) {
    on<PlayAudio>((event, emit) async {
      await _audioPlayer.setUrl(event.url);
      _audioPlayer.play();
      _audioPlayer.positionStream.listen((position) {
        add(AudioProgressChanged(position));
      });
      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          add(AudioCompleted());
        }
      });
      emit(AudioPlaying(
          position: Duration.zero,
          duration: _audioPlayer.duration ?? Duration.zero));
    });

    on<PauseAudio>((event, emit) async {
      _audioPlayer.pause();
      emit(AudioPaused(
          position: _audioPlayer.position,
          duration: _audioPlayer.duration ?? Duration.zero));
    });

    on<AudioProgressChanged>((event, emit) {
      if (state is AudioPlaying) {
        emit(AudioPlaying(
            position: event.position,
            duration: _audioPlayer.duration ?? Duration.zero));
      } else if (state is AudioPaused) {
        emit(AudioPaused(
            position: event.position,
            duration: _audioPlayer.duration ?? Duration.zero));
      }
    });

    on<AudioCompleted>((event, emit) {
      emit(AudioPaused(
          position: _audioPlayer.duration ?? Duration.zero,
          duration: _audioPlayer.duration ?? Duration.zero));
    });
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
