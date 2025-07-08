import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/like_unlike/like_unlike_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'featured_videos_model.dart';
export 'featured_videos_model.dart';

class FeaturedVideosWidget extends StatefulWidget {
  const FeaturedVideosWidget({super.key});

  static String routeName = 'FeaturedVideos';
  static String routePath = '/featuredVideos';

  @override
  State<FeaturedVideosWidget> createState() => _FeaturedVideosWidgetState();
}

class _FeaturedVideosWidgetState extends State<FeaturedVideosWidget> {
  late FeaturedVideosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturedVideosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FeaturedVideos'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: LaravelGroup.postsListCall.call(
        postTypeId: '7',
        token: FFAppState().Token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).davysGray,
                  ),
                ),
              ),
            ),
          );
        }
        final featuredVideosPostsListResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                                'FEATURED_VIDEOS_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        Flexible(
                          child: AutoSizeText(
                            FFLocalizations.of(context).getText(
                              '9a1uutn2' /* Featured Videos */,
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
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          final videoList = LaravelGroup.postsListCall
                              .dataList(
                            featuredVideosPostsListResponse.jsonBody,
                          )
                              ?.where((e) =>
                          functions.jsonToint(e, 'is_featured') ==
                              1)
                              .toList()
                              .toList() ??
                              [];
                          if (videoList.isEmpty) {
                            return EmptyWidget();
                          }

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: videoList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, videoListIndex) {
                              final videoListItem = videoList[videoListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 8.0, 20.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'FEATURED_VIDEOS_PAGE_Row_766h4ph1_ON_TAP');
                                          logFirebaseEvent('Row_navigate_to');

                                          context.pushNamed(
                                            VideoPostWidget.routeName,
                                            queryParameters: {
                                              'videoItem': serializeParam(
                                                videoListItem,
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              child: Builder(
                                                builder:
                                                    (context) {
                                                  double screenWidth = MediaQuery.of(context)
                                                      .size
                                                      .width;

                                                  double
                                                  imageWidth;
                                                  double
                                                  imageHeight;

                                                  if (screenWidth <
                                                      400) {
                                                    imageWidth =
                                                    110.0;
                                                    imageHeight =
                                                    65.0;
                                                  } else if (screenWidth <
                                                      800) {
                                                    imageWidth =
                                                    100.0;
                                                    imageHeight =
                                                    72.0;
                                                  } else {
                                                    imageWidth =
                                                    114.0;
                                                    imageHeight =
                                                    82.0;
                                                  }

                                                  return Image
                                                      .network(
                                                    getJsonField(videoListItem, r'''$.image''')
                                                        .toString(),
                                                    width:
                                                    imageWidth,
                                                    height:
                                                    imageHeight,
                                                    fit: BoxFit
                                                        .cover,
                                                    errorBuilder: (context, error, stackTrace) =>
                                                        Image.asset(
                                                          'assets/images/error_image.png',
                                                          width:
                                                          imageWidth,
                                                          height:
                                                          imageHeight,
                                                          fit:
                                                          BoxFit.cover,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                      Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              videoListItem,
                                                              r'''$.title''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF232323),
                                                              fontSize:
                                                              16.0,
                                                              letterSpacing:
                                                              0.0,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontStyle: FlutterFlowTheme.of(
                                                                  context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0,
                                                          8.0,
                                                          0.0,
                                                          0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'FEATURED_VIDEOS_Container_w5757fjb_ON_TA');
                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                VideoPostWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                {
                                                                  'videoItem':
                                                                  serializeParam(
                                                                    videoListItem,
                                                                    ParamType
                                                                        .JSON,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .primaryText,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    20.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    6.0,
                                                                    3.0,
                                                                    12.0,
                                                                    3.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .play_arrow,
                                                                      color: FlutterFlowTheme.of(
                                                                          context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                      18.0,
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                          context)
                                                                          .getText(
                                                                        '7q8xj8ae' /* Play */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodyMedium
                                                                          .override(
                                                                        font:
                                                                        GoogleFonts.poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                        color:
                                                                        FlutterFlowTheme.of(context).secondaryBackground,
                                                                        fontSize:
                                                                        13.0,
                                                                        letterSpacing:
                                                                        0.0,
                                                                        fontWeight:
                                                                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                        fontStyle:
                                                                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                            children: [
                                                              LikeUnlikeWidget(
                                                                key: Key(
                                                                    'Keytxf_${videoListIndex}_of_${videoList.length}'),
                                                                post:
                                                                videoListItem,
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                Colors
                                                                    .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'FEATURED_VIDEOS_Container_40swb4uu_ON_TA');
                                                                  logFirebaseEvent(
                                                                      'Container_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                    true,
                                                                    backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                    enableDrag:
                                                                    false,
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                          Padding(
                                                                            padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                            NotesWidget(
                                                                              post: videoListItem,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                              () {}));
                                                                },
                                                                child:
                                                                Container(
                                                                  width: 28.0,
                                                                  height: 28.0,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .edit_note_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryText,
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                Colors
                                                                    .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'FEATURED_VIDEOS_Container_f74lg948_ON_TA');
                                                                  logFirebaseEvent(
                                                                      'Container_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                    true,
                                                                    backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                    enableDrag:
                                                                    false,
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                          Padding(
                                                                            padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                            SavetoPlaylistWidget(
                                                                              post: videoListItem,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                              () {}));
                                                                },
                                                                child:
                                                                Container(
                                                                  width: 28.0,
                                                                  height: 28.0,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .playlist_add,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryText,
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              if (FFAppConstants
                                                                  .HideShare)
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                      InkWell(
                                                                        splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                        focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                        hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                        highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'FEATURED_VIDEOS_Container_oet1f40w_ON_TA');
                                                                          logFirebaseEvent(
                                                                              'Container_share');
                                                                          await Share
                                                                              .share(
                                                                            getJsonField(
                                                                              videoListItem,
                                                                              r'''$.data''',
                                                                            ).toString(),
                                                                            sharePositionOrigin:
                                                                            getWidgetBoundingBox(context),
                                                                          );
                                                                        },
                                                                        child:
                                                                        Container(
                                                                          width:
                                                                          28.0,
                                                                          height:
                                                                          28.0,
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            color: FlutterFlowTheme.of(context)
                                                                                .secondaryBackground,
                                                                            shape: BoxShape
                                                                                .circle,
                                                                          ),
                                                                          alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                          FaIcon(
                                                                            FontAwesomeIcons
                                                                                .share,
                                                                            color: FlutterFlowTheme.of(context)
                                                                                .primaryText,
                                                                            size:
                                                                            18.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                ),
                                                              if (false)
                                                                Container(
                                                                  width: 28.0,
                                                                  height: 28.0,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .file_download_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .primaryText,
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.bottomNavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BottomNavBarWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
