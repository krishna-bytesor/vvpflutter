import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'simple_audio_player_model.dart';
export 'simple_audio_player_model.dart';

class SimpleAudioPlayerWidget extends StatefulWidget {
  const SimpleAudioPlayerWidget({
    super.key,
    required this.currentAudio,
  });

  final dynamic currentAudio;

  @override
  State<SimpleAudioPlayerWidget> createState() =>
      _SimpleAudioPlayerWidgetState();
}

class _SimpleAudioPlayerWidgetState extends State<SimpleAudioPlayerWidget> {
  late SimpleAudioPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimpleAudioPlayerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFEF8EB),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                child: Slider(
                  activeColor: FlutterFlowTheme.of(context).primaryText,
                  inactiveColor: Color(0xFFDAD7D5),
                  min: 0.0,
                  max: 500.0,
                  value: _model.sliderValue ??= 200.0,
                  divisions: 500,
                  onChanged: (newValue) {
                    safeSetState(() => _model.sliderValue = newValue);
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'xh9bmf9b' /* 0:00 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Color(0xFF436073),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '0n5u1yq7' /* 3:34 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Color(0xFF436073),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.replay_10,
                        color: FlutterFlowTheme.of(context).backGrey,
                        size: 28.0,
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0x14969696),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.skip_previous,
                          color: Color(0xFF232323),
                          size: 25.0,
                        ),
                      ),
                      if (_model.pause)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SIMPLE_AUDIO_PLAYER_Container_ndw9hda5_O');
                            logFirebaseEvent(
                                'Container_update_component_state');
                            _model.pause = false;
                            safeSetState(() {});
                            logFirebaseEvent('Container_play_sound');
                            _model.soundPlayer ??= AudioPlayer();
                            if (_model.soundPlayer!.playing) {
                              await _model.soundPlayer!.stop();
                            }
                            _model.soundPlayer!.setVolume(1.0);
                            await _model.soundPlayer!
                                .setUrl(getJsonField(
                                  widget.currentAudio,
                                  r'''$.acf.audio_file''',
                                ).toString())
                                .then((_) => _model.soundPlayer!.play());
                          },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: FlutterFlowTheme.of(context).oldLace,
                              size: 30.0,
                            ),
                          ),
                        ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0x14969696),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.skip_next_sharp,
                          color: Color(0xFF232323),
                          size: 25.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.forward_10,
                          color: FlutterFlowTheme.of(context).backGrey,
                          size: 28.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!_model.pause)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'SIMPLE_AUDIO_PLAYER_Container_y4a0c31f_O');
                    logFirebaseEvent('Container_update_component_state');
                    _model.pause = true;
                    safeSetState(() {});
                    logFirebaseEvent('Container_stop_sound');
                    _model.soundPlayer?.stop();
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6260),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.pause_rounded,
                      color: FlutterFlowTheme.of(context).oldLace,
                      size: 25.0,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
