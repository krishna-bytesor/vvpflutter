import '/flutter_flow/flutter_flow_util.dart';
import 'simple_audio_player_widget.dart' show SimpleAudioPlayerWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SimpleAudioPlayerModel extends FlutterFlowModel<SimpleAudioPlayerWidget> {
  ///  Local state fields for this component.

  bool pause = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Slider widget.
  double? sliderValue;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
