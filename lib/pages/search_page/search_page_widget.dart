import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';
import 'package:v_v_p_swami/audio_helpers/player_invoke.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/like_unlike/like_unlike_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  static String routeName = 'SearchPage';
  static String routePath = '/searchPage';

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget>
    with TickerProviderStateMixin {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SearchPage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 2000),
                                          () async {
                                        logFirebaseEvent(
                                            'SEARCH_TextField_r1fha8qa_ON_TEXTFIELD_C');
                                        if (_model.tabBarCurrentIndex == 0) {
                                          logFirebaseEvent(
                                              'TextField_refresh_database_request');
                                          safeSetState(() => _model
                                              .audiPagingController
                                              ?.refresh());
                                          await _model.waitForOnePageForAudi();
                                        } else {
                                          if (_model.tabBarCurrentIndex == 1) {
                                            logFirebaseEvent(
                                                'TextField_refresh_database_request');
                                            safeSetState(() => _model
                                                .prabhupadPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForPrabhupad();
                                          } else {
                                            if (_model.tabBarCurrentIndex ==
                                                2) {
                                              logFirebaseEvent(
                                                  'TextField_refresh_database_request');
                                              safeSetState(() => _model
                                                  .videosPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForVideos();
                                            } else {
                                              logFirebaseEvent(
                                                  'TextField_refresh_database_request');
                                              safeSetState(() => _model
                                                  .apiRequestCompleter4 = null);
                                              await _model
                                                  .waitForApiRequestCompleted4();
                                            }
                                          }
                                        }
                                      },
                                    ),
                                    autofocus: false,
                                    textInputAction: TextInputAction.search,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText:
                                      FFLocalizations.of(context).getText(
                                        'm66y6jhv' /* Search here.. */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontWeight,
                                          fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontStyle,
                                        ),
                                        color: Color(0xBF57636C),
                                        letterSpacing: 0.0,
                                        fontWeight:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontWeight,
                                          fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xAA7D7D7D),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      suffixIcon: _model
                                          .textController!.text.isNotEmpty
                                          ? InkWell(
                                        onTap: () async {
                                          _model.textController?.clear();
                                          logFirebaseEvent(
                                              'SEARCH_TextField_r1fha8qa_ON_TEXTFIELD_C');
                                          if (_model.tabBarCurrentIndex ==
                                              0) {
                                            logFirebaseEvent(
                                                'TextField_refresh_database_request');
                                            safeSetState(() => _model
                                                .audiPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForAudi();
                                          } else {
                                            if (_model
                                                .tabBarCurrentIndex ==
                                                1) {
                                              logFirebaseEvent(
                                                  'TextField_refresh_database_request');
                                              safeSetState(() => _model
                                                  .prabhupadPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForPrabhupad();
                                            } else {
                                              if (_model
                                                  .tabBarCurrentIndex ==
                                                  2) {
                                                logFirebaseEvent(
                                                    'TextField_refresh_database_request');
                                                safeSetState(() => _model
                                                    .videosPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForVideos();
                                              } else {
                                                logFirebaseEvent(
                                                    'TextField_refresh_database_request');
                                                safeSetState(() => _model
                                                    .apiRequestCompleter4 =
                                                null);
                                                await _model
                                                    .waitForApiRequestCompleted4();
                                              }
                                            }
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          size: 24.0,
                                        ),
                                      )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .error,
                                      letterSpacing: 0.0,
                                      fontWeight:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AutoSizeText(
                          FFLocalizations.of(context).getText(
                            'gf4q8b9z' /* Search Results */,
                          ),
                          textAlign: TextAlign.center,
                          minFontSize: 12.0,
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
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
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
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
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    indicatorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    tabs: [
                                      Tab(
                                        text:
                                        FFLocalizations.of(context).getText(
                                          'w9v7s505' /* Audio */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                        FFLocalizations.of(context).getText(
                                          'tfiphk2e' /* Prabhupada */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                        FFLocalizations.of(context).getText(
                                          'k5d4rmiv' /* Video */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                        FFLocalizations.of(context).getText(
                                          '50ua0qmq' /* Gallery */,
                                        ),
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                            () async {
                                          logFirebaseEvent(
                                              'SEARCH_PAGE_PAGE_Tab_ycbpt3ba_ON_TAP');
                                          logFirebaseEvent(
                                              'Tab_refresh_database_request');
                                          safeSetState(() => _model
                                              .audiPagingController
                                              ?.refresh());
                                          await _model.waitForOnePageForAudi();
                                        },
                                            () async {
                                          logFirebaseEvent(
                                              'SEARCH_PAGE_PAGE_Tab_1ga2392u_ON_TAP');
                                          logFirebaseEvent(
                                              'Tab_refresh_database_request');
                                          safeSetState(() => _model
                                              .prabhupadPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForPrabhupad();
                                        },
                                            () async {
                                          logFirebaseEvent(
                                              'SEARCH_PAGE_PAGE_Tab_eqshbfp7_ON_TAP');
                                          logFirebaseEvent(
                                              'Tab_refresh_database_request');
                                          safeSetState(() => _model
                                              .videosPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForVideos();
                                        },
                                            () async {
                                          logFirebaseEvent(
                                              'SEARCH_PAGE_PAGE_Tab_v8ukvux6_ON_TAP');
                                          logFirebaseEvent(
                                              'Tab_refresh_database_request');
                                          safeSetState(() => _model
                                              .apiRequestCompleter4 = null);
                                          await _model
                                              .waitForApiRequestCompleted4();
                                        }
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24.0, 0.0, 24.0, 0.0),
                                          child: RefreshIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'SEARCH_PAGE_PAGE_audi_ON_PULL_TO_REFRESH');
                                              logFirebaseEvent(
                                                  'audi_refresh_database_request');
                                              safeSetState(() => _model
                                                  .audiPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForAudi();
                                            },
                                            child: PagedListView<
                                                ApiPagingParams,
                                                dynamic>.separated(
                                              pagingController:
                                              _model.setAudiController(
                                                    (nextPageMarker) => LaravelGroup
                                                    .searchPostCall
                                                    .call(
                                                  token: FFAppState().Token,
                                                  search:
                                                  valueOrDefault<String>(
                                                    _model.textController.text,
                                                    'abcdefghijk',
                                                  ),
                                                  page: nextPageMarker
                                                      .nextPageNumber +
                                                      1,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0),
                                              primary: false,
                                              reverse: false,
                                              scrollDirection: Axis.vertical,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 12.0),
                                              builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  dynamic>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .davysGray,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Customize what your widget looks like when it's loading another page.
                                                newPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .davysGray,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => EmptyWidget(),
                                                itemBuilder:
                                                    (context, _, postIndex) {
                                                  final postItem = _model
                                                      .audiPagingController!
                                                      .itemList![postIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      InkWell(
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
                                                              'SEARCH_PAGE_PAGE_Row_he59rra1_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Row_update_app_state');
                                                          FFAppState()
                                                              .audioUrl =
                                                              getJsonField(
                                                                postItem,
                                                                r'''$.data''',
                                                              ).toString();
                                                          FFAppState()
                                                              .currentAudioTrack =
                                                              postItem;
                                                          FFAppState()
                                                              .AudioPlayerSongIndex =
                                                              postIndex;
                                                          FFAppState().AudioPlayerList =
                                                              functions
                                                                  .jsontoListJson(
                                                                  postItem)
                                                                  .toList()
                                                                  .cast<
                                                                  dynamic>();
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Row_navigate_to');
                                                          playerPlayProcessDebounce(
                                                            _model
                                                                .audiPagingController!
                                                                .itemList!
                                                                .map((sObj) => {
                                                              'id': sObj[
                                                              "id"]
                                                                  .toString(),
                                                              'title': sObj[
                                                              "title"]
                                                                  .toString(),
                                                              'artist':
                                                              sObj["author"]
                                                                  .toString(),
                                                              'album': sObj[
                                                              "album"]
                                                                  .toString(),
                                                              'genre': sObj[
                                                              "language"]
                                                                  .toString(),
                                                              'image': sObj[
                                                              "image"]
                                                                  .toString(),
                                                              'url': sObj[
                                                              "data"]
                                                                  .toString(),
                                                              'user_id':
                                                              sObj["artistsId"]
                                                                  .toString(),
                                                              'user_name':
                                                              sObj["artists"]
                                                                  .toString(),
                                                              'extra': {
                                                                'json':
                                                                sObj,
                                                                'date':
                                                                sObj["date"].toString(),
                                                                'country':
                                                                sObj["country"].toString(),
                                                                'city':
                                                                sObj["city"].toString(),
                                                              },
                                                            })
                                                                .toList(),
                                                            postIndex,
                                                          );
                                                          Navigator.push(
                                                            context,
                                                            PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (_,
                                                                  ___,
                                                                  __) =>
                                                              const MainPlayerView(),
                                                            ),
                                                          );
                                                          // context.pushNamed(
                                                          //   NowPlayingPageWidget
                                                          //       .routeName,
                                                          //   queryParameters: {
                                                          //     'currentAudio':
                                                          //         serializeParam(
                                                          //       postItem,
                                                          //       ParamType.JSON,
                                                          //     ),
                                                          //     'chapters':
                                                          //         serializeParam(
                                                          //       functions
                                                          //           .jsontoListJson(
                                                          //               postItem),
                                                          //       ParamType.JSON,
                                                          //       isList: true,
                                                          //     ),
                                                          //     'currentAudioIndex':
                                                          //         serializeParam(
                                                          //       postIndex,
                                                          //       ParamType.int,
                                                          //     ),
                                                          //   }.withoutNulls,
                                                          // );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            if (getJsonField(
                                                              postItem,
                                                              r'''$.image''',
                                                            ) !=
                                                                null)
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    postItem,
                                                                    r'''$.image''',
                                                                  ).toString(),
                                                                  width: 104.0,
                                                                  height: 104.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/error_image.png',
                                                                        width:
                                                                        104.0,
                                                                        height:
                                                                        104.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                ),
                                                              ),
                                                            if (getJsonField(
                                                              postItem,
                                                              r'''$.image''',
                                                            ) ==
                                                                null)
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child:
                                                                Image.asset(
                                                                  'assets/images/AboutImage.png',
                                                                  width: 104.0,
                                                                  height: 104.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                  Alignment(
                                                                      -1.0,
                                                                      0.0),
                                                                ),
                                                              ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                          Text(
                                                                            getJsonField(
                                                                              postItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF232323),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Wrap(
                                                                      spacing:
                                                                      0.0,
                                                                      runSpacing:
                                                                      0.0,
                                                                      alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                      crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                      direction:
                                                                      Axis.horizontal,
                                                                      runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                      verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                      clipBehavior:
                                                                      Clip.none,
                                                                      children: [
                                                                        if (getJsonField(
                                                                          postItem,
                                                                          r'''$.shloka_part''',
                                                                        ) !=
                                                                            null)
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              functions.combineTextFromJson(
                                                                                  getJsonField(
                                                                                    postItem,
                                                                                    r'''$.shloka_part''',
                                                                                  ).toString(),
                                                                                  getJsonField(
                                                                                    postItem,
                                                                                    r'''$.shloka_chapter''',
                                                                                  ).toString()),
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).backGrey,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                          ),
                                                                        if ((getJsonField(
                                                                          postItem,
                                                                          r'''$.shloka_part''',
                                                                        ) !=
                                                                            null) &&
                                                                            (getJsonField(
                                                                              postItem,
                                                                              r'''$.author''',
                                                                            ) !=
                                                                                null))
                                                                          SizedBox(
                                                                            height:
                                                                            16.0,
                                                                            child:
                                                                            VerticalDivider(
                                                                              thickness: 1.0,
                                                                              color: Color(0xFF7ECBC9),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                          postItem,
                                                                          r'''$.author''',
                                                                        ) !=
                                                                            null)
                                                                          Text(
                                                                            getJsonField(
                                                                              postItem,
                                                                              r'''$.author''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).backGrey,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                          ),
                                                                        if ((getJsonField(
                                                                          postItem,
                                                                          r'''$.author''',
                                                                        ) !=
                                                                            null) &&
                                                                            (getJsonField(
                                                                              postItem,
                                                                              r'''$.date''',
                                                                            ) !=
                                                                                null))
                                                                          SizedBox(
                                                                            height:
                                                                            16.0,
                                                                            child:
                                                                            VerticalDivider(
                                                                              thickness: 1.0,
                                                                              color: Color(0xFF7ECBC9),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                          postItem,
                                                                          r'''$.date''',
                                                                        ) !=
                                                                            null)
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              dateTimeFormat(
                                                                                "yyyy",
                                                                                functions.stringToDate(getJsonField(
                                                                                  postItem,
                                                                                  r'''$.date''',
                                                                                ).toString()),
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).backGrey,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              shape: BoxShape.rectangle,
                                                                            ),
                                                                            alignment:
                                                                            AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 3.0, 12.0, 3.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.play_arrow,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'rnm396nn' /* Play */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                            MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                            children:
                                                                            [
                                                                              LikeUnlikeWidget(
                                                                                key: Key('Keyydt_${postIndex}_of_${_model.audiPagingController!.itemList!.length}'),
                                                                                post: postItem,
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('SEARCH_Container_oacpmhot_ON_TAP');
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
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: NotesWidget(
                                                                                              post: postItem,
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
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.edit_note_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('SEARCH_Container_sxgsbyzs_ON_TAP');
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
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: SavetoPlaylistWidget(
                                                                                              post: postItem,
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
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.playlist_add,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (FFAppConstants.HideShare)
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('SEARCH_Container_fh8fjvfe_ON_TAP');
                                                                                    logFirebaseEvent('Container_action_block');
                                                                                    await action_blocks.allShare(
                                                                                      context,
                                                                                      url: getJsonField(
                                                                                        postItem,
                                                                                        r'''$.data''',
                                                                                      ).toString(),
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 28.0,
                                                                                    height: 28.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.share,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (false)
                                                                                Container(
                                                                                  width: 28.0,
                                                                                  height: 28.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.file_download_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                      8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                        Color(0xFFD9D9D9),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24.0, 0.0, 24.0, 0.0),
                                          child: RefreshIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'SEARCH_prabhupad_ON_PULL_TO_REFRESH');
                                              logFirebaseEvent(
                                                  'prabhupad_refresh_database_request');
                                              safeSetState(() => _model
                                                  .prabhupadPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForPrabhupad();
                                            },
                                            child: PagedListView<
                                                ApiPagingParams,
                                                dynamic>.separated(
                                              pagingController:
                                              _model.setPrabhupadController(
                                                    (nextPageMarker) => LaravelGroup
                                                    .searchPostCall
                                                    .call(
                                                  token: FFAppState().Token,
                                                  search:
                                                  valueOrDefault<String>(
                                                    _model.textController.text,
                                                    'abcdefghijk',
                                                  ),
                                                  page: nextPageMarker
                                                      .nextPageNumber +
                                                      1,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0),
                                              primary: false,
                                              reverse: false,
                                              scrollDirection: Axis.vertical,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 12.0),
                                              builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  dynamic>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .davysGray,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Customize what your widget looks like when it's loading another page.
                                                newPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .davysGray,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => EmptyWidget(),
                                                itemBuilder:
                                                    (context, _, postIndex) {
                                                  final postItem = _model
                                                      .prabhupadPagingController!
                                                      .itemList![postIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      InkWell(
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
                                                              'SEARCH_PAGE_PAGE_Row_ji52agqf_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Row_update_app_state');
                                                          FFAppState()
                                                              .audioUrl =
                                                              getJsonField(
                                                                postItem,
                                                                r'''$.data''',
                                                              ).toString();
                                                          FFAppState()
                                                              .currentAudioTrack =
                                                              postItem;
                                                          FFAppState()
                                                              .AudioPlayerSongIndex =
                                                              postIndex;
                                                          FFAppState().AudioPlayerList =
                                                              functions
                                                                  .jsontoListJson(
                                                                  postItem)
                                                                  .toList()
                                                                  .cast<
                                                                  dynamic>();
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Row_navigate_to');

                                                          playerPlayProcessDebounce(
                                                            _model
                                                                .audiPagingController!
                                                                .itemList!
                                                                .map((sObj) => {
                                                              'id': sObj[
                                                              "id"]
                                                                  .toString(),
                                                              'title': sObj[
                                                              "title"]
                                                                  .toString(),
                                                              'artist':
                                                              sObj["author"]
                                                                  .toString(),
                                                              'album': sObj[
                                                              "album"]
                                                                  .toString(),
                                                              'genre': sObj[
                                                              "language"]
                                                                  .toString(),
                                                              'image': sObj[
                                                              "image"]
                                                                  .toString(),
                                                              'url': sObj[
                                                              "data"]
                                                                  .toString(),
                                                              'user_id':
                                                              sObj["artistsId"]
                                                                  .toString(),
                                                              'user_name':
                                                              sObj["artists"]
                                                                  .toString(),
                                                              'extra': {
                                                                'json':
                                                                sObj,
                                                                'date':
                                                                sObj["date"].toString(),
                                                                'country':
                                                                sObj["country"].toString(),
                                                                'city':
                                                                sObj["city"].toString(),
                                                              },
                                                            })
                                                                .toList(),
                                                            postIndex,
                                                          );
                                                          Navigator.push(
                                                            context,
                                                            PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (_,
                                                                  ___,
                                                                  __) =>
                                                              const MainPlayerView(),
                                                            ),
                                                          );
                                                          // context.pushNamed(
                                                          //   NowPlayingPageWidget
                                                          //       .routeName,
                                                          //   queryParameters: {
                                                          //     'currentAudio':
                                                          //         serializeParam(
                                                          //       postItem,
                                                          //       ParamType.JSON,
                                                          //     ),
                                                          //     'chapters':
                                                          //         serializeParam(
                                                          //       functions
                                                          //           .jsontoListJson(
                                                          //               postItem),
                                                          //       ParamType.JSON,
                                                          //       isList: true,
                                                          //     ),
                                                          //     'currentAudioIndex':
                                                          //         serializeParam(
                                                          //       postIndex,
                                                          //       ParamType.int,
                                                          //     ),
                                                          //   }.withoutNulls,
                                                          // );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            if (getJsonField(
                                                              postItem,
                                                              r'''$.image''',
                                                            ) !=
                                                                null)
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    postItem,
                                                                    r'''$.image''',
                                                                  ).toString(),
                                                                  width: 104.0,
                                                                  height: 104.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/error_image.png',
                                                                        width:
                                                                        104.0,
                                                                        height:
                                                                        104.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                ),
                                                              ),
                                                            if (getJsonField(
                                                              postItem,
                                                              r'''$.image''',
                                                            ) ==
                                                                null)
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child:
                                                                Image.asset(
                                                                  'assets/images/AboutImage.png',
                                                                  width: 104.0,
                                                                  height: 104.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                  Alignment(
                                                                      -1.0,
                                                                      0.0),
                                                                ),
                                                              ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    SingleChildScrollView(
                                                                      scrollDirection:
                                                                      Axis.horizontal,
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                            Text(
                                                                              getJsonField(
                                                                                postItem,
                                                                                r'''$.title''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF232323),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        if (getJsonField(
                                                                          postItem,
                                                                          r'''$.shloka_part''',
                                                                        ) !=
                                                                            null)
                                                                          Flexible(
                                                                            child:
                                                                            Text(
                                                                              functions.combineTextFromJson(
                                                                                  getJsonField(
                                                                                    postItem,
                                                                                    r'''$.shloka_part''',
                                                                                  ).toString(),
                                                                                  getJsonField(
                                                                                    postItem,
                                                                                    r'''$.shloka_chapter''',
                                                                                  ).toString()),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF465058),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                          postItem,
                                                                          r'''$.shloka_part''',
                                                                        ) !=
                                                                            null)
                                                                          SizedBox(
                                                                            height:
                                                                            25.0,
                                                                            child:
                                                                            VerticalDivider(
                                                                              thickness: 1.0,
                                                                              color: Color(0xFF7ECBC9),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                          postItem,
                                                                          r'''$.author''',
                                                                        ) !=
                                                                            null)
                                                                          Text(
                                                                            getJsonField(
                                                                              postItem,
                                                                              r'''$.author''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).backGrey,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                          ),
                                                                        if ((getJsonField(
                                                                          postItem,
                                                                          r'''$.author''',
                                                                        ) !=
                                                                            null) &&
                                                                            (getJsonField(
                                                                              postItem,
                                                                              r'''$.date''',
                                                                            ) !=
                                                                                null))
                                                                          SizedBox(
                                                                            height:
                                                                            25.0,
                                                                            child:
                                                                            VerticalDivider(
                                                                              thickness: 1.0,
                                                                              color: Color(0xFF7ECBC9),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                          postItem,
                                                                          r'''$.date''',
                                                                        ) !=
                                                                            null)
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              dateTimeFormat(
                                                                                "yyyy",
                                                                                functions.stringToDate(getJsonField(
                                                                                  postItem,
                                                                                  r'''$.date''',
                                                                                ).toString()),
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).backGrey,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              shape: BoxShape.rectangle,
                                                                            ),
                                                                            alignment:
                                                                            AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 3.0, 12.0, 3.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.play_arrow,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'l28yt37s' /* Play */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                LikeUnlikeWidget(
                                                                                  key: Key('Key5ok_${postIndex}_of_${_model.prabhupadPagingController!.itemList!.length}'),
                                                                                  post: postItem,
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('SEARCH_Container_mnjoh4xo_ON_TAP');
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
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: NotesWidget(
                                                                                                post: postItem,
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
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.edit_note_outlined,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('SEARCH_Container_vwt2ss3i_ON_TAP');
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
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: SavetoPlaylistWidget(
                                                                                                post: postItem,
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
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.playlist_add,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (FFAppConstants.HideShare)
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('SEARCH_Container_bsglu4g0_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.allShare(
                                                                                        context,
                                                                                        url: getJsonField(
                                                                                          postItem,
                                                                                          r'''$.data''',
                                                                                        ).toString(),
                                                                                      );
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 28.0,
                                                                                      height: 28.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.share,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (false)
                                                                                  Container(
                                                                                    width: 28.0,
                                                                                    height: 28.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.file_download_outlined,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                      8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                        Color(0xFFD9D9D9),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24.0, 0.0, 24.0, 0.0),
                                          child: RefreshIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'SEARCH_videos_ON_PULL_TO_REFRESH');
                                              logFirebaseEvent(
                                                  'videos_refresh_database_request');
                                              safeSetState(() => _model
                                                  .videosPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForVideos();
                                            },
                                            child: PagedListView<
                                                ApiPagingParams,
                                                dynamic>.separated(
                                              pagingController:
                                              _model.setVideosController(
                                                    (nextPageMarker) => LaravelGroup
                                                    .searchPostCall
                                                    .call(
                                                  token: FFAppState().Token,
                                                  search:
                                                  valueOrDefault<String>(
                                                    _model.textController.text,
                                                    'abcdefghijk',
                                                  ),
                                                  page: nextPageMarker
                                                      .nextPageNumber +
                                                      1,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0),
                                              primary: false,
                                              shrinkWrap: true,
                                              reverse: false,
                                              scrollDirection: Axis.vertical,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 12.0),
                                              builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  dynamic>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .davysGray,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Customize what your widget looks like when it's loading another page.
                                                newPageProgressIndicatorBuilder:
                                                    (_) => Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .davysGray,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                noItemsFoundIndicatorBuilder:
                                                    (_) => EmptyWidget(),
                                                itemBuilder:
                                                    (context, _, postIndex) {
                                                  final postItem = _model
                                                      .videosPagingController!
                                                      .itemList![postIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      InkWell(
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
                                                              'SEARCH_PAGE_PAGE_Row_whyz6nmf_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Row_navigate_to');

                                                          context.pushNamed(
                                                            VideoPostWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'videoItem':
                                                              serializeParam(
                                                                postItem,
                                                                ParamType.JSON,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            if (getJsonField(
                                                              postItem,
                                                              r'''$.image''',
                                                            ) !=
                                                                null)
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    postItem,
                                                                    r'''$.image''',
                                                                  ).toString(),
                                                                  width: 144.0,
                                                                  height: 82.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/error_image.png',
                                                                        width:
                                                                        144.0,
                                                                        height:
                                                                        82.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                ),
                                                              ),
                                                            if (getJsonField(
                                                              postItem,
                                                              r'''$.image''',
                                                            ) ==
                                                                null)
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                                child:
                                                                Image.asset(
                                                                  'assets/images/AboutImage.png',
                                                                  width: 144.0,
                                                                  height: 82.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                  Alignment(
                                                                      -1.0,
                                                                      0.0),
                                                                ),
                                                              ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    SingleChildScrollView(
                                                                      scrollDirection:
                                                                      Axis.horizontal,
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                            Text(
                                                                              getJsonField(
                                                                                postItem,
                                                                                r'''$.title''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF232323),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                      Row(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              shape: BoxShape.rectangle,
                                                                            ),
                                                                            alignment:
                                                                            AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 3.0, 12.0, 3.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.play_arrow,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '96f1ydft' /* Play */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                            MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                            children:
                                                                            [
                                                                              LikeUnlikeWidget(
                                                                                key: Key('Keyuoh_${postIndex}_of_${_model.videosPagingController!.itemList!.length}'),
                                                                                post: postItem,
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('SEARCH_Container_gh8baury_ON_TAP');
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
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: NotesWidget(
                                                                                              post: postItem,
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
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.edit_note_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('SEARCH_Container_hpowj2n9_ON_TAP');
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
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: SavetoPlaylistWidget(
                                                                                              post: postItem,
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
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.playlist_add,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (FFAppConstants.HideShare)
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('SEARCH_Container_rlau3t29_ON_TAP');
                                                                                    logFirebaseEvent('Container_action_block');
                                                                                    await action_blocks.allShare(
                                                                                      context,
                                                                                      url: getJsonField(
                                                                                        postItem,
                                                                                        r'''$.data''',
                                                                                      ).toString(),
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 28.0,
                                                                                    height: 28.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.share,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (false)
                                                                                Container(
                                                                                  width: 28.0,
                                                                                  height: 28.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.file_download_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 18.0,
                                                                                  ),
                                                                                ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                      8.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                        Color(0xFFD9D9D9),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) =>
                                            FutureBuilder<ApiCallResponse>(
                                              future: _model.category(
                                                requestFn: () => LaravelGroup
                                                    .categoryListCall
                                                    .call(
                                                  token: FFAppState().Token,
                                                  postTypeId: '6',
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                      CircularProgressIndicator(
                                                        valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .davysGray,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerCategoryListResponse =
                                                snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: (_model
                                                          .apiRequestCompleter4 ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(LaravelGroup
                                                            .searchPostCall
                                                            .call(
                                                          token:
                                                          FFAppState()
                                                              .Token,
                                                          search:
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .textController
                                                                .text,
                                                            'abcdefghijk',
                                                          ),
                                                        )))
                                                          .future,
                                                      builder: (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                              CircularProgressIndicator(
                                                                valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                                  FlutterFlowTheme.of(
                                                                      context)
                                                                      .davysGray,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final photosSearchPostResponse =
                                                        snapshot.data!;

                                                        return Builder(
                                                          builder: (context) {
                                                            final post = LaravelGroup
                                                                .searchPostCall
                                                                .dataList(
                                                              photosSearchPostResponse
                                                                  .jsonBody,
                                                            )
                                                                ?.where((e) =>
                                                            functions
                                                                .jsonToint(
                                                                e,
                                                                'post_type_id') ==
                                                                6)
                                                                .toList()
                                                                .unique((e) =>
                                                                getJsonField(
                                                                  e,
                                                                  r'''$.category_id''',
                                                                ))
                                                                .toList() ??
                                                                [];
                                                            if (post.isEmpty) {
                                                              return EmptyWidget();
                                                            }

                                                            return RefreshIndicator(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .primaryText,
                                                              onRefresh: () async {
                                                                logFirebaseEvent(
                                                                    'SEARCH_photos_ON_PULL_TO_REFRESH');
                                                                logFirebaseEvent(
                                                                    'photos_refresh_database_request');
                                                                safeSetState(() =>
                                                                _model.apiRequestCompleter4 =
                                                                null);
                                                                await _model
                                                                    .waitForApiRequestCompleted4();
                                                              },
                                                              child: ListView
                                                                  .separated(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                    12.0),
                                                                primary: false,
                                                                shrinkWrap: true,
                                                                scrollDirection:
                                                                Axis.vertical,
                                                                itemCount:
                                                                post.length,
                                                                separatorBuilder: (_,
                                                                    __) =>
                                                                    SizedBox(
                                                                        height:
                                                                        12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                    postIndex) {
                                                                  final postItem =
                                                                  post[
                                                                  postIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color: Color(
                                                                              0xFFF8F2E9),
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                          border:
                                                                          Border
                                                                              .all(
                                                                            color: Color(
                                                                                0xFFD9D9D9),
                                                                          ),
                                                                        ),
                                                                        child:
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
                                                                                'SEARCH_PAGE_PAGE_Column_rfwqouoy_ON_TAP');
                                                                            logFirebaseEvent(
                                                                                'Column_navigate_to');

                                                                            context
                                                                                .pushNamed(
                                                                              PhotoAlbumWidget
                                                                                  .routeName,
                                                                              queryParameters:
                                                                              {
                                                                                'postList':
                                                                                serializeParam(
                                                                                  LaravelGroup.searchPostCall
                                                                                      .dataList(
                                                                                    photosSearchPostResponse.jsonBody,
                                                                                  )
                                                                                      ?.where((e) =>
                                                                                  getJsonField(
                                                                                    e,
                                                                                    r'''$.category_id''',
                                                                                  ) ==
                                                                                      getJsonField(
                                                                                        postItem,
                                                                                        r'''$.category_id''',
                                                                                      ))
                                                                                      .toList(),
                                                                                  ParamType.JSON,
                                                                                  isList: true,
                                                                                ),
                                                                                'title':
                                                                                serializeParam(
                                                                                  getJsonField(
                                                                                    LaravelGroup.categoryListCall
                                                                                        .dataList(
                                                                                      containerCategoryListResponse.jsonBody,
                                                                                    )
                                                                                        ?.where((e) =>
                                                                                    getJsonField(
                                                                                      e,
                                                                                      r'''$.id''',
                                                                                    ) ==
                                                                                        getJsonField(
                                                                                          postItem,
                                                                                          r'''$.category_id''',
                                                                                        ))
                                                                                        .toList()
                                                                                        .firstOrNull,
                                                                                    r'''$.name''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                          Column(
                                                                            mainAxisSize:
                                                                            MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize:
                                                                                MainAxisSize.max,
                                                                                children:
                                                                                [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        LaravelGroup.searchPostCall
                                                                                            .dataList(
                                                                                          photosSearchPostResponse.jsonBody,
                                                                                        )!
                                                                                            .where((e) =>
                                                                                        getJsonField(
                                                                                          e,
                                                                                          r'''$.category_id''',
                                                                                        ) ==
                                                                                            getJsonField(
                                                                                              postItem,
                                                                                              r'''$.category_id''',
                                                                                            ))
                                                                                            .toList()
                                                                                            .elementAtOrNull(0),
                                                                                        r'''$.data''',
                                                                                      ).toString(),
                                                                                      width: 170.0,
                                                                                      height: 170.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(8.0),
                                                                                          ),
                                                                                          child: Image.network(
                                                                                            getJsonField(
                                                                                              LaravelGroup.searchPostCall
                                                                                                  .dataList(
                                                                                                photosSearchPostResponse.jsonBody,
                                                                                              )!
                                                                                                  .where((e) =>
                                                                                              getJsonField(
                                                                                                e,
                                                                                                r'''$.category_id''',
                                                                                              ) ==
                                                                                                  getJsonField(
                                                                                                    postItem,
                                                                                                    r'''$.category_id''',
                                                                                                  ))
                                                                                                  .toList()
                                                                                                  .elementAtOrNull(1),
                                                                                              r'''$.data''',
                                                                                            ).toString(),
                                                                                            width: 170.0,
                                                                                            height: 85.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(0.0),
                                                                                          ),
                                                                                          child: Image.network(
                                                                                            getJsonField(
                                                                                              LaravelGroup.searchPostCall
                                                                                                  .dataList(
                                                                                                photosSearchPostResponse.jsonBody,
                                                                                              )!
                                                                                                  .where((e) =>
                                                                                              getJsonField(
                                                                                                e,
                                                                                                r'''$.category_id''',
                                                                                              ) ==
                                                                                                  getJsonField(
                                                                                                    postItem,
                                                                                                    r'''$.category_id''',
                                                                                                  ))
                                                                                                  .toList()
                                                                                                  .elementAtOrNull(2),
                                                                                              r'''$.data''',
                                                                                            ).toString(),
                                                                                            width: 170.0,
                                                                                            height: 85.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 1.0)).around(SizedBox(height: 1.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 1.0)),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                                                    12.0,
                                                                                    6.0,
                                                                                    12.0,
                                                                                    6.0),
                                                                                child:
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              LaravelGroup.categoryListCall
                                                                                                  .dataList(
                                                                                                containerCategoryListResponse.jsonBody,
                                                                                              )!
                                                                                                  .where((e) =>
                                                                                              getJsonField(
                                                                                                e,
                                                                                                r'''$.id''',
                                                                                              ) ==
                                                                                                  getJsonField(
                                                                                                    postItem,
                                                                                                    r'''$.category_id''',
                                                                                                  ))
                                                                                                  .toList()
                                                                                                  .firstOrNull,
                                                                                              r'''$.name''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.poppins(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: Color(0xFF232323),
                                                                                              fontSize: 20.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    postItem,
                                                                                                    r'''$.city''',
                                                                                                  )?.toString(),
                                                                                                  'ISCKON Temple',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                                  color: Color(0xFF465058),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        borderRadius: BorderRadius.circular(25.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 3.0, 12.0, 3.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              "yyyy",
                                                                                              functions.stringToDate(getJsonField(
                                                                                                postItem,
                                                                                                r'''$.created_at''',
                                                                                              ).toString()),
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            '-',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.poppins(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                      Divider(
                                                                        thickness:
                                                                        1.0,
                                                                        color: Color(
                                                                            0xFFD9D9D9),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                        8.0)),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
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
    );
  }
}
