import '/components/like_unlike/like_unlike_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_post_model.dart';
import 'package:flutter_html/flutter_html.dart';
export 'video_post_model.dart';

class VideoPostWidget extends StatefulWidget {
  const VideoPostWidget({
    super.key,
    required this.videoItem,
    this.categoryItem,
  });

  final dynamic videoItem;
  final dynamic categoryItem;

  static String routeName = 'VideoPost';
  static String routePath = '/videopost';

  @override
  State<VideoPostWidget> createState() => _VideoPostWidgetState();
}

class _VideoPostWidgetState extends State<VideoPostWidget> {
  late VideoPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'VideoPost'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
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
          stops: [0.0, 0.25, 0.5, 0.75, 1.0],
          begin: AlignmentDirectional(0.31, -1.0),
          end: AlignmentDirectional(-0.31, 1.0),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
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
                            logFirebaseEvent(
                                'VIDEO_POST_PAGE_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        Flexible(
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              getJsonField(
                                widget.categoryItem,
                                r'''$.name''',
                              )?.toString(),
                              'Video',
                            ),
                            textAlign: TextAlign.center,
                            minFontSize: 12.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                        ),
                        Container(
                          width: 60.0,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                    FlutterFlowYoutubePlayer(
                      url: getJsonField(
                        widget.videoItem,
                        r'''$.data''',
                      ).toString(),
                      autoPlay: false,
                      looping: true,
                      mute: false,
                      showControls: true,
                      showFullScreen: true,
                      strictRelatedVideos: false,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  getJsonField(
                                    widget.videoItem,
                                    r'''$.title''',
                                  ).toString(),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF232323),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                if (getJsonField(
                                      widget.videoItem,
                                      r'''$.shloka_part''',
                                    ) !=
                                    null)
                                  Text(
                                    functions.combineTextFromJson(
                                        getJsonField(
                                          widget.videoItem,
                                          r'''$.shloka_part''',
                                        ).toString(),
                                        getJsonField(
                                          widget.videoItem,
                                          r'''$.shloka_chapter''',
                                        ).toString()),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                if (getJsonField(
                                      widget.videoItem,
                                      r'''$.shloka_part''',
                                    ) !=
                                    null)
                                  SizedBox(
                                    height: 25.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: Color(0xFF7ECBC9),
                                    ),
                                  ),
                                if (getJsonField(
                                      widget.videoItem,
                                      r'''$.city''',
                                    ) !=
                                    null)
                                  Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.videoItem,
                                        r'''$.city''',
                                      )?.toString(),
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                if ((getJsonField(
                                          widget.videoItem,
                                          r'''$.city''',
                                        ) !=
                                        null) &&
                                    (getJsonField(
                                          widget.videoItem,
                                          r'''$.date''',
                                        ) !=
                                        null))
                                  SizedBox(
                                    height: 25.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: Color(0xFF7ECBC9),
                                    ),
                                  ),
                                if (getJsonField(
                                      widget.videoItem,
                                      r'''$.date''',
                                    ) !=
                                    null)
                                  Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        "yyyy",
                                        functions.stringToDate(getJsonField(
                                          widget.videoItem,
                                          r'''$.date''',
                                        ).toString()),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                if ((getJsonField(
                                          widget.videoItem,
                                          r'''$.date''',
                                        ) !=
                                        null) &&
                                    (getJsonField(
                                          widget.videoItem,
                                          r'''$.author''',
                                        ) !=
                                        null))
                                  SizedBox(
                                    height: 25.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: Color(0xFF7ECBC9),
                                    ),
                                  ),
                                if (getJsonField(
                                      widget.videoItem,
                                      r'''$.author''',
                                    ) !=
                                    null)
                                  Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget.videoItem,
                                        r'''$.author''',
                                      )?.toString(),
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.likeUnlikeModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: LikeUnlikeWidget(
                                    post: widget.videoItem!,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'VIDEO_POST_Container_70b5pqic_ON_TAP');
                                    logFirebaseEvent('Container_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: NotesWidget(
                                                post: widget.videoItem!,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.edit_note_outlined,
                                      color: FlutterFlowTheme.of(context)
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
                                        'VIDEO_POST_Container_s4hh9xe5_ON_TAP');
                                    logFirebaseEvent('Container_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SavetoPlaylistWidget(
                                                post: widget.videoItem!,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.playlist_add,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                                if (false)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VIDEO_POST_Container_zcu95c30_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_action_block');
                                      await action_blocks.downloadFile(
                                        context,
                                        fileJson: widget.videoItem,
                                      );
                                    },
                                    child: Container(
                                      width: 28.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.file_download_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 21.0,
                                      ),
                                    ),
                                  ),
                                if (FFAppConstants.HideShare)
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIDEO_POST_Container_ge4jugy2_ON_TAP');
                                        logFirebaseEvent('Container_share');
                                        await Share.share(
                                          getJsonField(
                                            widget.videoItem,
                                            r'''$.data''',
                                          ).toString(),
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                      },
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.share,
                                          color: FlutterFlowTheme.of(context)
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
                    Divider(
                      thickness: 1.0,
                      color: Color(0xFFD9D9D9),
                    ),
                    if (getJsonField(
                          widget.videoItem,
                          r'''$.content''',
                        ) !=
                        null)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Html(
                          data: getJsonField(
                            widget.videoItem,
                            r'''$.content''',
                          ).toString(),
                          style: {
                            "body": Style(
                              color: Color(0xFF232323),
                              fontSize: FontSize(14.0),
                              fontFamily: 'Poppins',
                            ),
                            "h1": Style(
                                fontSize: FontSize(22.0),
                                fontWeight: FontWeight.bold),
                            "h2": Style(
                                fontSize: FontSize(18.0),
                                fontWeight: FontWeight.bold),
                            "strong": Style(fontWeight: FontWeight.bold),
                            "p": Style(margin: Margins.only(bottom: 8)),
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
