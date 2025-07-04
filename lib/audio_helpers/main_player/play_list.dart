import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:v_v_p_swami/audio_helpers/main_player/playlist_song_row.dart';
import 'package:v_v_p_swami/audio_helpers/page_manager.dart';
import 'package:v_v_p_swami/audio_helpers/service_locator.dart';
import 'package:v_v_p_swami/flutter_flow/flutter_flow_theme.dart';
import 'package:v_v_p_swami/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';

class PlayPlayList extends StatefulWidget {
  const PlayPlayList({super.key});

  @override
  State<PlayPlayList> createState() => _PlayPlayListState();
}

class _PlayPlayListState extends State<PlayPlayList> {
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    final mediaQuery = MediaQuery.of(context);
    final animationsMap = <String, AnimationInfo>{};

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 500.0.ms,
            duration: 8000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-200.0, 0.0),
          ),
        ],
      ),
    });

    return Dismissible(
      key: const Key('current_playing_play_list'),
      onDismissed: (direction) => {Navigator.pop(context)},
      direction: DismissDirection.down,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFEFDBB6),
                    Color(0xFFFEF7E7),
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0.0, 1.0),
                ),
              ),
              padding: EdgeInsets.only(
                top: mediaQuery.padding.top + 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: ValueListenableBuilder<MediaItem?>(
                valueListenable: pageManager.currentSongNotifier,
                builder: (context, mediaItem, child) {
                  if (mediaItem == null) return const SizedBox();

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                            child: Container(
                              width: 60,
                              height: 5,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        dense: false,
                        title: Text(
                          mediaItem.title,
                          style: const TextStyle(
                            color: Color(0xff232323),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          mediaItem.artist ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: mediaItem.artUri.toString(),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                "assets/images/app_launcher_icon.png",
                                height: 345,
                                width: 345,
                                fit: BoxFit.cover,
                              );
                            },
                            placeholder: (context, url) {
                              return Image.asset(
                                "assets/images/app_launcher_icon.png",
                                height: 345,
                                width: 345,
                                fit: BoxFit.cover,
                              );
                            },
                            width: 54,
                            height: 54,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: pageManager.progressNotifier,
                        builder: (context, valueState, child) {
                          bool dragging = false;

                          final value = min(
                              valueState.current.inMilliseconds.toDouble(),
                              valueState.total.inMilliseconds.toDouble());

                          return SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 2,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 8),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 16),
                            ),
                            child: Slider(
                              value: value,
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveColor: const Color.fromARGB(100, 0, 0, 0),
                              secondaryActiveColor: Color(0xFFEA5555),
                              secondaryTrackValue:
                                  valueState.buffered.inMilliseconds.toDouble(),
                              min: 0,
                              max: max(
                                  valueState.current.inMilliseconds.toDouble(),
                                  valueState.total.inMilliseconds.toDouble()),
                              onChanged: (newVal) {
                                if (!dragging) {
                                  dragging = true;
                                }

                                pageManager.seek(
                                  Duration(
                                    milliseconds: newVal.round(),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: pageManager.progressNotifier,
                        builder: (context, valueState, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                          .firstMatch('${valueState.current}')
                                          ?.group(1) ??
                                      '${valueState.current}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 12),
                                ),
                                Text(
                                  RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                          .firstMatch('${valueState.total}')
                                          ?.group(1) ??
                                      '${valueState.total}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: pageManager.seekBackward10Seconds,
                            icon: const Icon(
                              Icons.replay_10,
                              size: 20,
                              color: Color(0xFF232323),
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: pageManager.isFirstSongNotifier,
                            builder: (context, isFirst, child) {
                              return IconButton(
                                onPressed:
                                    (isFirst) ? null : pageManager.previous,
                                icon: Icon(
                                  Icons.skip_previous_rounded,
                                  size: 32,
                                  color: (isFirst)
                                      ? const Color(0xFF232323)
                                      : const Color(0xFF232323),
                                ),
                              );
                            },
                          ),
                          ValueListenableBuilder<ButtonState>(
                            valueListenable: pageManager.playButtonNotifier,
                            builder: (context, value, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  ButtonState.loading == value
                                      ? SizedBox(
                                          width: 65,
                                          height: 65,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText),
                                          ),
                                        )
                                      : Container(
                                          width: 65,
                                          height: 65,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .lightCoral,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: value == ButtonState.playing
                                              ? InkWell(
                                                  onTap: pageManager.pause,
                                                  child: Icon(
                                                    Icons.pause_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oldLace,
                                                    size: 45,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: pageManager.play,
                                                  child: Icon(
                                                    Icons.play_arrow_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oldLace,
                                                    size: 45,
                                                  ),
                                                ),
                                        ),
                                ],
                              );
                            },
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: pageManager.isLastSongNotifier,
                            builder: (context, isLast, child) {
                              return IconButton(
                                onPressed: (isLast) ? null : pageManager.next,
                                icon: Icon(
                                  size: 32,
                                  Icons.skip_next_rounded,
                                  color: (isLast)
                                      ? const Color(0xFF232323)
                                      : const Color(0xFF232323),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            onPressed: pageManager.seekForward10Seconds,
                            icon: const Icon(
                              Icons.forward_10,
                              size: 20,
                              color: Color(0xFF232323),
                            ),
                          ),
                        ].divide(
                          const SizedBox(
                            height: 50,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFEFDBB6),
                      Color(0xFFFEF7E7),
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0.0, 1.0),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: ValueListenableBuilder(
                  valueListenable: pageManager.playlistNotifier,
                  builder: (context, queue, child) {
                    final int queueStateIndex = pageManager
                                .currentSongNotifier.value ==
                            null
                        ? 0
                        : queue.indexOf(pageManager.currentSongNotifier.value!);

                    return Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: ReorderableListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: queue.length,
                        onReorder: (oldIndex, newIndex) {
                          if (oldIndex < newIndex) {
                            newIndex--;
                          }
                          pageManager.moveMediaItem(oldIndex, newIndex);
                        },
                        itemBuilder: (context, index) {
                          var sObj = queue[index];

                          return Dismissible(
                            key: ValueKey(sObj.id),
                            direction: index == queueStateIndex
                                ? DismissDirection.none
                                : DismissDirection.horizontal,
                            onDismissed: (direction) {
                              pageManager.removeQueueItemAt(index);
                            },
                            child: PlaylistSongRow(
                              sObj: sObj,
                              left: (index == queueStateIndex)
                                  ? Icon(
                                      Icons.pause_circle_outline_outlined,
                                      size: 32,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    )
                                  : Icon(
                                      Icons.play_circle_outline_rounded,
                                      size: 32,
                                      color:
                                          FlutterFlowTheme.of(context).backGrey,
                                    ),
                              onPressed: () {
                                pageManager.skipToQueueItem(index);
                                if (pageManager.playButtonNotifier.value ==
                                    ButtonState.paused) {
                                  pageManager.play();
                                }
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper to format duration as mm:ss
String formatDuration(Duration? duration) {
  if (duration == null) return '0:00';
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}
