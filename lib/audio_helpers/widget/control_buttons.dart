import 'package:flutter/material.dart';
import '../../audio_helpers/page_manager.dart';
import '../../audio_helpers/service_locator.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class ControlButtons extends StatelessWidget {
  final bool shuffle;
  final bool miniPlayer;
  final List buttons;

  const ControlButtons(
      {super.key,
      this.shuffle = false,
      this.miniPlayer = false,
      this.buttons = const ['Previous', 'Play/Pause', 'Next']});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: buttons.map((e) {
        switch (e) {
          case "Previous":
            return ValueListenableBuilder<bool>(
                valueListenable: pageManager.isFirstSongNotifier,
                builder: (context, first, __) {
                  return IconButton(
                    onPressed: first ? null : pageManager.previous,
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: miniPlayer ? 30 : 50,
                    ),
                  );
                });
          case 'Play/Pause':
            return SizedBox(
              // width: miniPlayer ? 40 : 70,
              // height: miniPlayer ? 40 : 70,
              child: ValueListenableBuilder<ButtonState>(
                valueListenable: pageManager.playButtonNotifier,
                builder: (context, value, __) {
                  return Stack(
                    children: [
                      if (value == ButtonState.loading)
                        Center(
                          child: SizedBox(
                            width: miniPlayer ? 40 : 70,
                            height: miniPlayer ? 40 : 70,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        ),
                      if (miniPlayer)
                        Center(
                          child: value == ButtonState.playing
                              ? IconButton(
                                  onPressed: pageManager.pause,
                                  icon: Icon(
                                    Icons.pause_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32,
                                  ),
                                )
                              : IconButton(
                                  onPressed: pageManager.play,
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32,
                                  ),
                                ),
                        )
                      else
                        Center(
                          child: value == ButtonState.playing
                              ? IconButton(
                                  onPressed: pageManager.pause,
                                  icon: Icon(
                                    Icons.pause_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 50,
                                  ),
                                )
                              : IconButton(
                                  onPressed: pageManager.play,
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 50,
                                  ),
                                ),
                        )
                    ],
                  );
                },
              ),
            );
          case "Next":
            return ValueListenableBuilder<bool>(
                valueListenable: pageManager.isLastSongNotifier,
                builder: (context, isLast, __) {
                  return IconButton(
                    onPressed: isLast ? null : pageManager.next,
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: miniPlayer ? 30 : 50,
                    ),
                  );
                });
          default:
            return Container();
        }
      }).toList(),
    );
  }
}
