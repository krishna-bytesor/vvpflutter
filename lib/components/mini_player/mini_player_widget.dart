import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mini_player_model.dart';
import 'package:v_v_p_swami/audio_helpers/page_manager.dart';
import 'package:v_v_p_swami/audio_helpers/service_locator.dart';
import 'package:v_v_p_swami/audio_helpers/audio_handler.dart';
import 'package:audio_service/audio_service.dart';
export 'mini_player_model.dart';

class MiniPlayerWidget extends StatefulWidget {
  const MiniPlayerWidget({
    super.key,
    this.audio,
  });

  final AudioStruct? audio;

  @override
  State<MiniPlayerWidget> createState() => _MiniPlayerWidgetState();
}

class _MiniPlayerWidgetState extends State<MiniPlayerWidget> {
  late MiniPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniPlayerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.audio != null) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 85.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      widget.audio!.image,
                      fit: BoxFit.contain,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.audio?.audioLabel,
                              'Audio Title...',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.skip_previous_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 40.0,
                              ),
                              Stack(
                                children: [
                                  if (true)
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 40.0,
                                    ),
                                  if (false)
                                    Icon(
                                      Icons.pause_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 40.0,
                                    ),
                                ],
                              ),
                              Icon(
                                Icons.skip_next_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 40.0,
                              ),
                              IconButton(
                                icon: Icon(Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground),
                                onPressed: () async {
                                  final pageManager = getIt<PageManager>();
                                  await pageManager.audioHandler.stop();
                                  pageManager.currentSongNotifier.value = null;
                                  pageManager.setLoadingNewAudio(false);
                                  pageManager.playButtonNotifier.value =
                                      ButtonState.paused;
                                  setState(() {});
                                  print(
                                      'Mini player closed and audio handler stopped.');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          );
        }
      },
    );
  }
}
