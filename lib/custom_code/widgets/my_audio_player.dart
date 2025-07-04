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

import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'dart:async';
import 'package:just_audio_background/just_audio_background.dart';

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer(
      {Key? key,
      this.width,
      this.height,
      required this.playList,
      this.showShloka,
      this.showTranscript,
      required this.currentIndex})
      : super(key: key);

  final double? width;
  final double? height;
  final int currentIndex;
  final List<dynamic> playList;
  final Future Function()? showShloka;
  final Future Function()? showTranscript;

  @override
  State<MyAudioPlayer> createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer>
    with SingleTickerProviderStateMixin {
  late Duration? duration;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  Duration? selectedTimer;
  bool isLooping = false;
  bool isShuffling = false;
  bool isSpeakerOn = true;
  int currentSongIndex = 0;
  List<dynamic> trackList = [];
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();

    currentSongIndex = widget.currentIndex;
    FFAppState().AudioPlayerSongIndex = widget.currentIndex;
    for (int i = 0; i < widget.playList.length; i++) {
      trackList.add(LockCachingAudioSource(
        Uri.parse(widget.playList[i]['data']),
        tag: MediaItem(
          id: '$i',
          album: widget.playList[i]['author'],
          title: widget.playList[i]['title'],
          artUri: null,
        ),
      ));
    }

    audioPlayer.setAudioSource(trackList[currentSongIndex]);
    audioPlayer.play();

    audioPlayer.playerStateStream.listen((PlayerState state) {
      setState(() {
        totalDuration = audioPlayer.duration ?? Duration.zero;
        currentPosition = audioPlayer.position;
      });

      if (state.processingState == ProcessingState.completed) {
        playNext();
      }

      // Update currentURL
      if (state.playing) {
        //FFAppState().audioUrl = widget.currentUrl;
      }
    });
    audioPlayer.positionStream.listen((position) {
      setState(() {
        totalDuration = audioPlayer.duration ?? Duration.zero;
        currentPosition = position;
      });
      // Check if the selected timer is complete
      if (selectedTimer != null && currentPosition >= selectedTimer!) {
        audioPlayer.pause();
        setState(() {
          selectedTimer = null;
        });
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
  }

  void updatePosition(double value) {
    final newPosition = Duration(milliseconds: value.toInt());
    seekTo(newPosition); // Complete the method call by passing newPosition
  }

  void skip(Duration duration) {
    final newPosition = currentPosition + duration;
    if (newPosition < Duration.zero) {
      seekTo(Duration.zero);
    } else if (newPosition > totalDuration) {
      seekTo(totalDuration);
    } else {
      seekTo(newPosition);
    }
  }

  void playPrevious() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
    } else {
      currentSongIndex = widget.playList.length - 1;
    }
    FFAppState().AudioPlayerSongIndex = currentSongIndex;
    audioPlayer.hasPrevious ? audioPlayer.seekToPrevious() : null;
    audioPlayer.setAudioSource(trackList[currentSongIndex]);
    audioPlayer.play();
  }

  void playPause() {
    audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play();
  }

  void playNext() {
    if (isShuffling) {
      //currentSongIndex = _getRandomIndex();
    } else {
      if (currentSongIndex < widget.playList.length - 1) {
        currentSongIndex++;
      } else {
        currentSongIndex = 0;
      }
    }

    /// audioPlayer.hasNext ? audioPlayer.seekToNext() : null;
    ///
    FFAppState().AudioPlayerSongIndex = currentSongIndex;
    audioPlayer.setAudioSource(trackList[currentSongIndex]);
    audioPlayer.play();
  }

  void toggleLooping() {
    setState(() {
      isLooping = !isLooping;
      audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  void toggleShuffle() {
    setState(() {
      isShuffling = !isShuffling;
    });
  }

  void toggleSpeaker() {
    setState(() {
      isSpeakerOn = !isSpeakerOn;
      if (isSpeakerOn) {
        audioPlayer.setVolume(1.0);
      } else {
        audioPlayer.setVolume(0.0);
      }
    });
  }

  void setTimer(Duration duration) {
    setState(() {
      selectedTimer = duration;
      if (duration == Duration.zero) {
        audioPlayer.pause(); // Pause the player if the selected timer is 0
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                activeColor: FlutterFlowTheme.of(context).bittersweet,
                inactiveColor: Color(0xFFDAD7D5),
                value: currentPosition.inMilliseconds.toDouble().clamp(
                    0.0,
                    (totalDuration.inMilliseconds.toDouble() > 0
                        ? totalDuration.inMilliseconds.toDouble()
                        : 1.0)),
                min: 0,
                max: totalDuration.inMilliseconds > 0
                    ? totalDuration.inMilliseconds.toDouble()
                    : 1.0,
                onChanged: (double value) {
                  updatePosition(value);
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                    ),
                    Text(
                      '${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => skip(Duration(seconds: -10)),
                        // child: Icon(
                        //   Icons.fast_rewind_outlined,
                        //   color: Color(0xFF787878),
                        //   size: 45,
                        // ),
                        child: Icon(
                          Icons.replay_10,
                          color: FlutterFlowTheme.of(context).backGrey,
                          size: 28,
                        )),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: playPrevious,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F1E5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.skip_previous,
                          color: Color(0xFF232323),
                          size: 35,
                        ),
                      ),
                    ),
                    if (!audioPlayer.playing)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: playPause,
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lightCoral,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: FlutterFlowTheme.of(context).oldLace,
                            size: 30,
                          ),
                        ),
                      ),
                    if (audioPlayer.playing)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: playPause,
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lightCoral,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            Icons.pause,
                            color: FlutterFlowTheme.of(context).oldLace,
                            size: 25,
                          ),
                        ),
                      ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: playNext,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F1E5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.skip_next,
                          color: Color(0xFF232323),
                          size: 35,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => skip(Duration(seconds: 10)),
                        child: Icon(
                          Icons.forward_10,
                          color: FlutterFlowTheme.of(context).backGrey,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().showPlayList = true;
                            FFAppState().update(() {});
                          },
                          child: Text(
                            'Up Next',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).backGrey,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            widget.showShloka!();
                            setState(() {});
                          },
                          child: Text(
                            'Shloka',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).backGrey,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            widget.showTranscript!();
                            setState(() {});
                          },
                          child: Text(
                            'Transcript',
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).backGrey,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      FFAppState().showPlayList
          ? Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFEFDBB6),
                      Color(0xFFFAEDD6),
                      Color(0xFFFEF7E7),
                      Color(0xFFEFDBB6),
                      Color(0xFFFAEDD6)
                    ],
                    stops: [0, 0.25, 0.5, 0.75, 1],
                    begin: AlignmentDirectional(0.31, -1),
                    end: AlignmentDirectional(-0.31, 1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: Text(
                            'Chapters',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          final chapter =
                              widget!.playList!.map((e) => e).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: chapter.length,
                            itemBuilder: (context, chapterIndex) {
                              final chapterItem = chapter[chapterIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().currentAudioTrack = chapterItem;
                                  FFAppState().audioUrl = getJsonField(
                                    chapterItem,
                                    r'''$.data''',
                                  ).toString();
                                  FFAppState().update(() {});
                                  currentSongIndex = chapterIndex;
                                  audioPlayer.setAudioSource(
                                      trackList[currentSongIndex]);
                                  totalDuration =
                                      audioPlayer.duration ?? Duration.zero;
                                  currentPosition = audioPlayer.position;
                                  audioPlayer.play();

                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (chapterIndex != currentSongIndex)
                                          Icon(
                                            Icons.play_circle_outline_sharp,
                                            color: Color(0xFF888282),
                                            size: 28,
                                          ),
                                        if (chapterIndex == currentSongIndex)
                                          FaIcon(
                                            FontAwesomeIcons.pauseCircle,
                                            color: Color(0xFFF26B6C),
                                            size: 24,
                                          ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  chapterItem,
                                                  r'''$.title''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                        ),
                                              ),
                                              Text(
                                                '28 minutes',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 5)),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(width: 12))
                                          .around(SizedBox(width: 12)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container()
    ]);
  }
}
