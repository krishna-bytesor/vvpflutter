import '/components/like_unlike/like_unlike_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'now_playing_page_model.dart';
export 'now_playing_page_model.dart';

class NowPlayingPageWidget extends StatefulWidget {
  const NowPlayingPageWidget({
    super.key,
    required this.currentAudio,
    required this.chapters,
    int? currentAudioIndex,
  }) : this.currentAudioIndex = currentAudioIndex ?? 0;

  final dynamic currentAudio;
  final List<dynamic>? chapters;
  final int currentAudioIndex;

  static String routeName = 'NowPlayingPage';
  static String routePath = '/nowplaying';

  @override
  State<NowPlayingPageWidget> createState() => _NowPlayingPageWidgetState();
}

class _NowPlayingPageWidgetState extends State<NowPlayingPageWidget>
    with TickerProviderStateMixin {
  late NowPlayingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NowPlayingPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NowPlayingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NOW_PLAYING_NowPlayingPage_ON_INIT_STATE');
      logFirebaseEvent('NowPlayingPage_update_app_state');
      FFAppState().isDownloadingToLocal = false;
      FFAppState().update(() {});
    });

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
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: FlutterFlowTheme.of(context).secondaryText,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFEFDBB6),
                Color(0xFFFAEDD6),
                Color(0xFFFEF7E7),
                Color(0xFFEFDBB6),
                Color(0xFFFAEDD6)
              ],
              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
              begin: AlignmentDirectional(0.31, -1.0),
              end: AlignmentDirectional(-0.31, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.chevron_left,
                        color: Color(0xFF436073),
                        size: 32.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('NOW_PLAYING_chevron_left_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    AutoSizeText(
                      FFLocalizations.of(context).getText(
                        'o5daqsrv' /* Now Playing */,
                      ),
                      textAlign: TextAlign.center,
                      minFontSize: 12.0,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Container(
                      width: 60.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          22.0, 0.0, 22.0, 220.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0xFFD9D9D9),
                                    width: 1.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!_model.showTranscript &&
                                        !_model.showShloka)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.network(
                                              getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.image''',
                                              ).toString(),
                                              width: 345.0,
                                              height: 345.0,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 345.0,
                                                height: 345.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (_model.showTranscript ||
                                        _model.showShloka)
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(17.0),
                                              child: Image.asset(
                                                'assets/images/comingSoon.png',
                                                width: 345.0,
                                                height: 345.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.title''',
                                              ).toString(),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF232323),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation']!),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      width: double.infinity,
                                      height: 30.0,
                                      child: custom_widgets.ScrollingText(
                                        width: double.infinity,
                                        height: 30.0,
                                        text: getJsonField(
                                          FFAppState().currentAudioTrack,
                                          r'''$.title''',
                                        ).toString(),
                                        fontSize: 18.0,
                                        textColor: Color(0xFF232323),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.shloka_part''',
                                              ) !=
                                              null)
                                            Flexible(
                                              child: AutoSizeText(
                                                functions.combineTextFromJson(
                                                    getJsonField(
                                                      FFAppState()
                                                          .currentAudioTrack,
                                                      r'''$.shloka_part''',
                                                    ).toString(),
                                                    getJsonField(
                                                      FFAppState()
                                                          .currentAudioTrack,
                                                      r'''$.shloka_chapter''',
                                                    ).toString()),
                                                maxLines: 1,
                                                minFontSize: 8.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .backGrey,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          if ((getJsonField(
                                                    FFAppState()
                                                        .currentAudioTrack,
                                                    r'''$.city''',
                                                  ) !=
                                                  null) &&
                                              (getJsonField(
                                                    FFAppState()
                                                        .currentAudioTrack,
                                                    r'''$.shloka_part''',
                                                  ) !=
                                                  null))
                                            SizedBox(
                                              height: 16.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color: Color(0xFF7ECBC9),
                                              ),
                                            ),
                                          if (getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.city''',
                                              ) !=
                                              null)
                                            AutoSizeText(
                                              getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.city''',
                                              ).toString(),
                                              maxLines: 1,
                                              minFontSize: 8.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .backGrey,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                          if (getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.date''',
                                              ) !=
                                              null)
                                            SizedBox(
                                              height: 16.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color: Color(0xFF7ECBC9),
                                              ),
                                            ),
                                          if (getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.date''',
                                              ) !=
                                              null)
                                            AutoSizeText(
                                              dateTimeFormat(
                                                "yyyy",
                                                functions
                                                    .stringToDate(getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.date''',
                                                ).toString()),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              maxLines: 1,
                                              minFontSize: 8.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .backGrey,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                          if (getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.author''',
                                              ) !=
                                              null)
                                            SizedBox(
                                              height: 16.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color: Color(0xFF7ECBC9),
                                              ),
                                            ),
                                          if (getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.author''',
                                              ) !=
                                              null)
                                            AutoSizeText(
                                              getJsonField(
                                                FFAppState().currentAudioTrack,
                                                r'''$.author''',
                                              ).toString(),
                                              maxLines: 1,
                                              minFontSize: 8.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .backGrey,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: wrapWithModel(
                                            model: _model.likeUnlikeModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: LikeUnlikeWidget(
                                              post: FFAppState()
                                                  .currentAudioTrack,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'NOW_PLAYING_Container_r6lmtnm6_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: NotesWidget(
                                                        post: FFAppState()
                                                            .currentAudioTrack,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 28.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.edit_note_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 21.0,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'NOW_PLAYING_Container_v03d2g9n_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          SavetoPlaylistWidget(
                                                        post: FFAppState()
                                                            .currentAudioTrack,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 28.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.playlist_add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 18.0,
                                            ),
                                          ),
                                        ),
                                        if (functions.isFavourite(
                                            getJsonField(
                                              widget.currentAudio,
                                              r'''$.id''',
                                            ),
                                            FFAppState()
                                                .DownloadedFiles
                                                .toList()))
                                          Container(
                                            width: 28.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.download_done,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 21.0,
                                            ),
                                          ),
                                        if (!FFAppState()
                                                .isDownloadingToLocal &&
                                            !functions.isFavourite(
                                                getJsonField(
                                                  widget.currentAudio,
                                                  r'''$.id''',
                                                ),
                                                FFAppState()
                                                    .DownloadedFiles
                                                    .toList()))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'NOW_PLAYING_Container_g4regw2j_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState()
                                                  .isDownloadingToLocal = true;
                                              FFAppState().update(() {});
                                              logFirebaseEvent(
                                                  'Container_widget_animation');
                                              if (animationsMap[
                                                      'iconOnActionTriggerAnimation'] !=
                                                  null) {
                                                animationsMap[
                                                        'iconOnActionTriggerAnimation']!
                                                    .controller
                                                  ..reset()
                                                  ..repeat();
                                              }
                                              logFirebaseEvent(
                                                  'Container_action_block');
                                              await action_blocks.downloadFile(
                                                context,
                                                fileJson: FFAppState()
                                                    .currentAudioTrack,
                                              );
                                              logFirebaseEvent(
                                                  'Container_widget_animation');
                                              if (animationsMap[
                                                      'iconOnActionTriggerAnimation'] !=
                                                  null) {
                                                animationsMap[
                                                        'iconOnActionTriggerAnimation']!
                                                    .controller
                                                    .stop();
                                              }
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState()
                                                  .isDownloadingToLocal = false;
                                              FFAppState().update(() {});
                                            },
                                            child: Container(
                                              width: 28.0,
                                              height: 28.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.file_download_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 21.0,
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().isDownloadingToLocal)
                                          Container(
                                            width: 28.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.downloading,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 21.0,
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'iconOnActionTriggerAnimation']!,
                                            ),
                                          ),
                                        if (FFAppConstants.HideShare)
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NOW_PLAYING_Container_0zf1g3um_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_share');
                                                await Share.share(
                                                  getJsonField(
                                                    widget.currentAudio,
                                                    r'''$.data''',
                                                  ).toString(),
                                                  sharePositionOrigin:
                                                      getWidgetBoundingBox(
                                                          context),
                                                );
                                              },
                                              child: Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.share,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 21.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (true)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.sizeOf(context).height * 0.8,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFFEF8EB),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (FFAppState().showPlayList)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'NOW_PLAYING_Container_yrrlty07_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        FFAppState().showPlayList = false;
                                        FFAppState().update(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: 70.0,
                                            height: 5.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFD9D9D9),
                                              borderRadius:
                                                  BorderRadius.circular(22.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Flexible(
                                    child: custom_widgets.MyAudioPlayer(
                                      width: double.infinity,
                                      height: double.infinity,
                                      currentIndex:
                                          FFAppState().AudioPlayerSongIndex,
                                      playList: FFAppState().AudioPlayerList,
                                      showShloka: () async {
                                        logFirebaseEvent(
                                            'NOW_PLAYING_Container_xgpslr36_CALLBACK');
                                        logFirebaseEvent(
                                            'MyAudioPlayer_update_page_state');
                                        _model.showShloka = !_model.showShloka;
                                        safeSetState(() {});
                                      },
                                      showTranscript: () async {
                                        logFirebaseEvent(
                                            'NOW_PLAYING_Container_xgpslr36_CALLBACK');
                                        logFirebaseEvent(
                                            'MyAudioPlayer_update_page_state');
                                        _model.showTranscript =
                                            !_model.showTranscript;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
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
      )
    );
  }
}





