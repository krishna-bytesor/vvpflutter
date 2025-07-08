import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../audio_helpers/page_manager.dart';
import '../../audio_helpers/service_locator.dart';
import 'control_buttons.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../main_player/main_player.dart';
import 'package:text_scroll/text_scroll.dart';

class MiniPlayerView extends StatefulWidget {
  static const MiniPlayerView _instance = MiniPlayerView._internal();

  factory MiniPlayerView() {
    return _instance;
  }
  const MiniPlayerView._internal();

  @override
  State<MiniPlayerView> createState() => _MiniPlayerViewState();
}

class _MiniPlayerViewState extends State<MiniPlayerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return ValueListenableBuilder<AudioProcessingState>(
      valueListenable: pageManager.playbackStatNotifier,
      builder: (context, processingState, __) {
        if (processingState == AudioProcessingState.idle) {
          return const SizedBox();
        }

        return ValueListenableBuilder<MediaItem?>(
            valueListenable: pageManager.currentSongNotifier,
            builder: (context, mediaItem, __) {
              if (mediaItem == null) {
                // Hide mini player completely when loading
                return const SizedBox.shrink();
              }

              return Dismissible(
                key: const Key('mini_player'),
                direction: DismissDirection.down,
                onDismissed: (direction) {
                  Feedback.forLongPress(context);
                  pageManager.stop();
                },
                child: Dismissible(
                    key: Key(mediaItem.id),
                    confirmDismiss: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        pageManager.previous();
                      } else {
                        pageManager.next();
                      }
                      return Future.value(false);
                    },
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Color.fromARGB(100, 255, 246, 219),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  dense: false,
                                  onTap: () {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder: (_, ___, __) =>
                                              const MainPlayerView(),
                                        ),
                                      );
                                    });
                                  },
                                  title: TextScroll(
                                    mediaItem.title,
                                    intervalSpaces: 10,
                                    // numberOfReps: 2,
                                    velocity: Velocity(
                                        pixelsPerSecond: Offset(50, 0)),
                                    style: TextStyle(
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
                                  leading: Hero(
                                      tag: 'currentArtWork',
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                mediaItem.artUri.toString(),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              return Image.asset(
                                                "assets/images/app_launcher_icon.png",
                                                fit: BoxFit.cover,
                                              );
                                            },
                                            placeholder: (context, url) {
                                              return Image.asset(
                                                "assets/images/app_launcher_icon.png",
                                                fit: BoxFit.cover,
                                              );
                                            },
                                            width: 54,
                                            height: 54,
                                          ),
                                        ),
                                      )),
                                  trailing: const ControlButtons(
                                    miniPlayer: true,
                                    buttons: ['Play/Pause', 'Next'],
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: pageManager.progressNotifier,
                                  builder: (context, valueState, child) {
                                    final position = valueState.current;
                                    final totalDuration = valueState.total;

                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                                    .firstMatch(
                                                        '${valueState.current}')
                                                    ?.group(1) ??
                                                '${valueState.current}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          position == null
                                              ? const SizedBox()
                                              : (position.inSeconds.toDouble() <
                                                          0.0 ||
                                                      (position.inSeconds
                                                              .toDouble() >
                                                          totalDuration
                                                              .inSeconds
                                                              .toDouble()))
                                                  ? const SizedBox()
                                                  : Expanded(
                                                      child: SliderTheme(
                                                        data: SliderThemeData(
                                                            activeTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            inactiveTrackColor:
                                                                Color(
                                                                    0xffEFD9B6),
                                                            trackHeight: 3,
                                                            thumbColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            thumbShape:
                                                                const RoundSliderOverlayShape(
                                                                    overlayRadius:
                                                                        1.5),
                                                            overlayColor: Colors
                                                                .transparent,
                                                            overlayShape:
                                                                const RoundSliderOverlayShape(
                                                                    overlayRadius:
                                                                        1.0)),
                                                        child: Center(
                                                          child: Slider(
                                                              value: position
                                                                  .inSeconds
                                                                  .toDouble(),
                                                              max: totalDuration
                                                                  .inSeconds
                                                                  .toDouble(),
                                                              onChanged:
                                                                  (newPosition) {
                                                                pageManager
                                                                    .seek(
                                                                  Duration(
                                                                    seconds:
                                                                        newPosition
                                                                            .round(),
                                                                  ),
                                                                );
                                                              }),
                                                        ),
                                                      ),
                                                    ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                                    .firstMatch(
                                                        '${valueState.total}')
                                                    ?.group(1) ??
                                                '${valueState.total}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              );
            });
      },
    );
  }
}
