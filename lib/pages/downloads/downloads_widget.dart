import 'package:v_v_p_swami/audio_helpers/player_invoke.dart';
import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';

import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty_downloads/empty_downloads_widget.dart';
import '/components/like_unlike/like_unlike_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'downloads_model.dart';
export 'downloads_model.dart';

class DownloadsWidget extends StatefulWidget {
  const DownloadsWidget({super.key});

  static String routeName = 'Downloads';
  static String routePath = '/Downloads';

  @override
  State<DownloadsWidget> createState() => _DownloadsWidgetState();
}

class _DownloadsWidgetState extends State<DownloadsWidget>
    with TickerProviderStateMixin {
  late DownloadsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DownloadsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Downloads'});
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DOWNLOADS_PAGE_Downloads_ON_INIT_STATE');
      logFirebaseEvent('Downloads_custom_action');
      await actions.checkInternetConnection();
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final double screenWidth = MediaQuery.of(context).size.width;
    double gridImageHeight = screenWidth < 400 ? 180.0 : screenWidth < 800 ? 210.0 : 210.0;
    double titleFontSize = screenWidth < 400 ? 11.0 : screenWidth < 800 ? 12.0 : 13.0;
    double iconSize = screenWidth < 400 ? 14.0 : screenWidth < 800 ? 16.0 : 18.0;
    double containerSize = screenWidth < 400 ? 30.0 : screenWidth < 800 ? 30.0 : 28.0;
    double gridSpacing = screenWidth < 400 ? 4.0 : 8.0;
    int crossAxisCount = screenWidth < 400 ? 2 : 2;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).oldLace,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 32.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.chevron_left,
                                color: Color(0xFF436073),
                                size: 32.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'DOWNLOADS_PAGE_chevron_left_ICN_ON_TAP');
                                if (FFAppState().isOnline) {
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.pop();
                                } else {
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.goNamed(
                                      InternetConnectionWidget.routeName);
                                }
                              },
                            ),
                            Flexible(
                              child: AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  '1j2hwygd' /* Downloads */,
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
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor: Color(0xFF436073),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                  unselectedLabelStyle: TextStyle(),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  padding: EdgeInsets.all(4.0),
                                  tabs: [
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'aumc5tg3' /* Books */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'pcsbyjj9' /* Gallery */,
                                      ),
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [
                                      () async {},
                                      () async {}
                                    ][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(20.0, 10.0, 20.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final book = FFAppState()
                                                    .DownloadedFiles
                                                    .where((e) =>
                                                        getJsonField(
                                                          e,
                                                          r'''$.post_type_id''',
                                                        ) ==
                                                        getJsonField(
                                                          <String, int>{
                                                            'two': 2,
                                                          },
                                                          r'''$.two''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e)
                                                    .toList();
                                                if (book.isEmpty) {
                                                  return EmptyDownloadsWidget();
                                                }
                                      
                                                return RefreshIndicator(
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryText,
                                                  onRefresh: () async {},
                                                  child: GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: crossAxisCount,
                                                      crossAxisSpacing: gridSpacing,
                                                      mainAxisSpacing: gridSpacing,
                                                      childAspectRatio: 0.75,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: book.length,
                                                    itemBuilder:
                                                         (context, bookIndex) {
                                                      final bookItem =
                                                          book[bookIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'DOWNLOADS_PAGE_Column_az2ce8to_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Column_navigate_to');
                                      
                                                          context.pushNamed(
                                                            BookPostPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'bookItem':
                                                                  serializeParam(
                                                                bookItem,
                                                                ParamType.JSON,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    getJsonField(
                                                                  bookItem,
                                                                  r'''$.image''',
                                                                ).toString(),
                                                                width: double
                                                                    .infinity,
                                                                height: gridImageHeight,
                                                                fit: BoxFit.cover,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: double
                                                                      .infinity,
                                                                  height: gridImageHeight,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child: Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize
                                                                                .min,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                bookItem,
                                                                                r'''$.title''',
                                                                              ).toString(),
                                                                              textAlign:
                                                                                  TextAlign.start,
                                                                               style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                     fontSize: titleFontSize,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
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
                                                                        'DOWNLOADS_PAGE_Container_p5hmwqzg_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_action_block');
                                                                    await action_blocks
                                                                        .deleteDownloadFile(
                                                                      context,
                                                                      postFile:
                                                                          bookItem,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: containerSize,
                                                                    height: containerSize,
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
                                                                          .delete_forever,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: iconSize,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 20.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final photos = FFAppState()
                                                    .DownloadedFiles
                                                    .where((e) =>
                                                        getJsonField(
                                                          e,
                                                          r'''$.post_type_id''',
                                                        ) ==
                                                        getJsonField(
                                                          <String, int>{
                                                            'six': 6,
                                                          },
                                                          r'''$.six''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e)
                                                    .toList();
                                                if (photos.isEmpty) {
                                                  return EmptyDownloadsWidget();
                                                }
                                      
                                                return RefreshIndicator(
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryText,
                                                  onRefresh: () async {},
                                                  child: GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: crossAxisCount,
                                                      crossAxisSpacing: gridSpacing,
                                                      mainAxisSpacing: gridSpacing,
                                                      childAspectRatio: 0.75,
                                                    ),
                                                    primary: false,
                                                     shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: photos.length,
                                                    itemBuilder:
                                                        (context, photosIndex) {
                                                      final photosItem =
                                                          photos[photosIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'DOWNLOADS_PAGE_Image_jsisgcow_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Image_expand_image');
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds:
                                                                                  500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds:
                                                                                  500),
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        photosItem,
                                                                        r'''$.data''',
                                                                      ).toString(),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorWidget: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        getJsonField(
                                                                      photosItem,
                                                                      r'''$.data''',
                                                                    ).toString(),
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag: getJsonField(
                                                                photosItem,
                                                                r'''$.data''',
                                                              ).toString(),
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    photosItem,
                                                                    r'''$.data''',
                                                                  ).toString(),
                                                                  width: double
                                                                      .infinity,
                                                                  height: gridImageHeight,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image.asset(
                                                                    'assets/images/error_image.png',
                                                                    width: double
                                                                        .infinity,
                                                                    height: gridImageHeight,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                               5.0,
                                                                              5.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              photosItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: titleFontSize,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            ),
                                                                          ),
                                      
                                                                      ],
                                                                    ),
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
                                                                onTap: () async {
                                                                  logFirebaseEvent(
                                                                      'DOWNLOADS_PAGE_Container_4pao862a_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Container_action_block');
                                                                  await action_blocks
                                                                      .deleteDownloadFile(
                                                                    context,
                                                                    postFile:
                                                                        photosItem,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Container(
                                                                  width: containerSize,
                                                                  height: containerSize,
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
                                                                        .delete_forever,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: iconSize,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
      )
    );
  }
}





