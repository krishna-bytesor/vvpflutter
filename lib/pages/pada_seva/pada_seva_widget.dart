import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pada_seva_model.dart';
export 'pada_seva_model.dart';

class PadaSevaWidget extends StatefulWidget {
  const PadaSevaWidget({
    super.key,
    required this.categoryJson,
  });

  final dynamic categoryJson;

  static String routeName = 'PadaSeva';
  static String routePath = '/padaseva';

  @override
  State<PadaSevaWidget> createState() => _PadaSevaWidgetState();
}

class _PadaSevaWidgetState extends State<PadaSevaWidget>
    with TickerProviderStateMixin {
  late PadaSevaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PadaSevaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PadaSeva'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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
      child: SafeArea(
        child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).oldLace,
        body: FutureBuilder<ApiCallResponse>(
          future: LaravelGroup.postsListCall.call(
            postTypeId: '4',
            token: FFAppState().Token,
            categoryId: getJsonField(
              widget.categoryJson,
              r'''$.id''',
            ).toString(),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).davysGray,
                    ),
                  ),
                ),
              );
            }
            final containerPostsListResponse = snapshot.data!;

            return Container(
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                                        'PADA_SEVA_PAGE_chevron_left_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.pop();
                                  },
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'bodkbcuh' /* Pada Seva */,
                                    ),
                                    textAlign: TextAlign.center,
                                    minFontSize: 12.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                      unselectedLabelStyle: TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      padding: EdgeInsets.all(4.0),
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '3zcd73lo' /* Audio */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'u4atimj4' /* Video */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'm7msw15o' /* Books */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
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
                                        Builder(
                                          builder: (context) {
                                            final audioList = LaravelGroup
                                                    .postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )
                                                    ?.where((e) =>
                                                        getJsonField(
                                                          e,
                                                          r'''$.type''',
                                                        ) ==
                                                        functions.stringTOJson(
                                                            'audio'))
                                                    .toList()
                                                    .toList() ??
                                                [];
                                            if (audioList.isEmpty) {
                                              return EmptyWidget();
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: audioList.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 8.0),
                                              itemBuilder:
                                                  (context, audioListIndex) {
                                                final audioListItem =
                                                    audioList[audioListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 8.0, 20.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                'PADA_SEVA_PAGE_Row_ynay78rl_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Row_update_app_state');
                                                            FFAppState()
                                                                    .audioUrl =
                                                                getJsonField(
                                                              audioListItem,
                                                              r'''$.data''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .currentAudioTrack =
                                                                audioListItem;
                                                            FFAppState()
                                                                    .AudioPlayerSongIndex =
                                                                audioListIndex;
                                                            FFAppState()
                                                                    .AudioPlayerList =
                                                                LaravelGroup
                                                                    .postsListCall
                                                                    .dataList(
                                                                      containerPostsListResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .where((e) =>
                                                                        functions.jsonToint(
                                                                            e,
                                                                            'post_type_id') ==
                                                                        1)
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Row_navigate_to');

                                                            context.pushNamed(
                                                              NowPlayingPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'currentAudio':
                                                                    serializeParam(
                                                                  audioListItem,
                                                                  ParamType
                                                                      .JSON,
                                                                ),
                                                                'chapters':
                                                                    serializeParam(
                                                                  LaravelGroup
                                                                      .postsListCall
                                                                      .dataList(
                                                                        containerPostsListResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.where((e) =>
                                                                          functions.jsonToint(
                                                                              e,
                                                                              'post_type_id') ==
                                                                          1)
                                                                      .toList(),
                                                                  ParamType
                                                                      .JSON,
                                                                  isList: true,
                                                                ),
                                                                'currentAudioIndex':
                                                                    serializeParam(
                                                                  audioListIndex,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (getJsonField(
                                                                    audioListItem,
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
                                                                      audioListItem,
                                                                      r'''$.image''',
                                                                    ).toString(),
                                                                    width:
                                                                        104.0,
                                                                    height:
                                                                        104.0,
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
                                                                    audioListItem,
                                                                    r'''$.image''',
                                                                  ) ==
                                                                  null)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/AboutImage.png',
                                                                    width:
                                                                        104.0,
                                                                    height:
                                                                        104.0,
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
                                                                            Text(
                                                                              getJsonField(
                                                                                audioListItem,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          if (getJsonField(
                                                                                audioListItem,
                                                                                r'''$.shloka_part''',
                                                                              ) !=
                                                                              null)
                                                                            Flexible(
                                                                              child: Text(
                                                                                functions.combineTextFromJson(
                                                                                    getJsonField(
                                                                                      audioListItem,
                                                                                      r'''$.shloka_part''',
                                                                                    ).toString(),
                                                                                    getJsonField(
                                                                                      audioListItem,
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
                                                                                audioListItem,
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
                                                                                audioListItem,
                                                                                r'''$.city''',
                                                                              ) !=
                                                                              null)
                                                                            Text(
                                                                              getJsonField(
                                                                                audioListItem,
                                                                                r'''$.city''',
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
                                                                                    audioListItem,
                                                                                    r'''$.city''',
                                                                                  ) !=
                                                                                  null) &&
                                                                              (getJsonField(
                                                                                    audioListItem,
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
                                                                                audioListItem,
                                                                                r'''$.date''',
                                                                              ) !=
                                                                              null)
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                dateTimeFormat(
                                                                                  "yyyy",
                                                                                  functions.stringToDate(getJsonField(
                                                                                    audioListItem,
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
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
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
                                                                                        'tqfkobgv' /* Play */,
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
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                if (functions.isFavourite(
                                                                                    getJsonField(
                                                                                      audioListItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    FFAppState().FavouriteList.toList()))
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('PADA_SEVA_PAGE_Container_znuovhil_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.likeUnlikePost(
                                                                                        context,
                                                                                        postItem: audioListItem,
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
                                                                                      child: Icon(
                                                                                        Icons.favorite,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (!functions.isFavourite(
                                                                                    getJsonField(
                                                                                      audioListItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    FFAppState().FavouriteList.toList()))
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('PADA_SEVA_PAGE_Container_09ljvyxv_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.likeUnlikePost(
                                                                                        context,
                                                                                        postItem: audioListItem,
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
                                                                                      child: Icon(
                                                                                        Icons.favorite_border,
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
                                                                                    logFirebaseEvent('PADA_SEVA_PAGE_Container_z6a7uwbi_ON_TAP');
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
                                                                                                post: audioListItem,
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
                                                                                    logFirebaseEvent('PADA_SEVA_PAGE_Container_c9vjr23p_ON_TAP');
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
                                                                                                post: audioListItem,
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
                                                                                      logFirebaseEvent('PADA_SEVA_PAGE_Container_s1j7z3qn_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.allShare(
                                                                                        context,
                                                                                        url: getJsonField(
                                                                                          audioListItem,
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
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final videoList = LaravelGroup
                                                    .postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )
                                                    ?.where((e) =>
                                                        getJsonField(
                                                          e,
                                                          r'''$.type''',
                                                        ) ==
                                                        functions.stringTOJson(
                                                            'video'))
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
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 8.0),
                                              itemBuilder:
                                                  (context, videoListIndex) {
                                                final videoListItem =
                                                    videoList[videoListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 8.0, 20.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                'PADA_SEVA_PAGE_Row_y9iaj2m8_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Row_navigate_to');

                                                            context.pushNamed(
                                                              VideoPostWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'videoItem':
                                                                    serializeParam(
                                                                  videoListItem,
                                                                  ParamType
                                                                      .JSON,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (getJsonField(
                                                                    videoListItem,
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
                                                                      videoListItem,
                                                                      r'''$.image''',
                                                                    ).toString(),
                                                                    width:
                                                                        144.0,
                                                                    height:
                                                                        82.0,
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
                                                                    videoListItem,
                                                                    r'''$.image''',
                                                                  ) ==
                                                                  null)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/AboutImage.png',
                                                                    width:
                                                                        144.0,
                                                                    height:
                                                                        82.0,
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
                                                                            Text(
                                                                              getJsonField(
                                                                                videoListItem,
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
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
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
                                                                                        'gi20ndh7' /* Play */,
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
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                if (functions.isFavourite(
                                                                                    getJsonField(
                                                                                      videoListItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    FFAppState().FavouriteList.toList()))
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('PADA_SEVA_PAGE_Container_qu280tjn_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.likeUnlikePost(
                                                                                        context,
                                                                                        postItem: videoListItem,
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
                                                                                      child: Icon(
                                                                                        Icons.favorite,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (!functions.isFavourite(
                                                                                    getJsonField(
                                                                                      videoListItem,
                                                                                      r'''$.id''',
                                                                                    ),
                                                                                    FFAppState().FavouriteList.toList()))
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('PADA_SEVA_PAGE_Container_n89v9aao_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.likeUnlikePost(
                                                                                        context,
                                                                                        postItem: videoListItem,
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
                                                                                      child: Icon(
                                                                                        Icons.favorite_border,
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
                                                                                    logFirebaseEvent('PADA_SEVA_PAGE_Container_xv0bu5da_ON_TAP');
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
                                                                                                post: videoListItem,
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
                                                                                    logFirebaseEvent('PADA_SEVA_PAGE_Container_2hpso3jk_ON_TAP');
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
                                                                                                post: videoListItem,
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
                                                                                      logFirebaseEvent('PADA_SEVA_PAGE_Container_rop2oyq9_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.allShare(
                                                                                        context,
                                                                                        url: getJsonField(
                                                                                          videoListItem,
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
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 20.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final book = LaravelGroup
                                                      .postsListCall
                                                      .dataList(
                                                        containerPostsListResponse
                                                            .jsonBody,
                                                      )
                                                      ?.where((e) =>
                                                          getJsonField(
                                                            e,
                                                            r'''$.type''',
                                                          ) ==
                                                          functions
                                                              .stringTOJson(
                                                                  'pdf'))
                                                      .toList()
                                                      .toList() ??
                                                  [];
                                              if (book.isEmpty) {
                                                return EmptyWidget();
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
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10.0,
                                                    childAspectRatio: 0.7,
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
                                                            'PADA_SEVA_PAGE_Column_qt8aqxns_ON_TAP');
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
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                              errorWidget: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.png',
                                                                width: double
                                                                    .infinity,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      Padding(
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
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
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 13.0,
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
                                                                  splashColor:
                                                                      Colors
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
                                                                        'PADA_SEVA_PAGE_Icon_di1b86w2_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_alert_dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: Text('Please confirm'),
                                                                                    content: Text('Are you sure you want to download this book ?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('Cancel'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('Confirm'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      logFirebaseEvent(
                                                                          'Icon_launch_u_r_l');
                                                                      await launchURL(
                                                                          getJsonField(
                                                                        bookItem,
                                                                        r'''$.data''',
                                                                      ).toString());
                                                                      logFirebaseEvent(
                                                                          'Icon_action_block');
                                                                      await action_blocks
                                                                          .downloadFile(
                                                                        context,
                                                                        fileJson:
                                                                            getJsonField(
                                                                          bookItem,
                                                                          r'''$.data''',
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .download_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
            );
          },
        ),
      ),
      )
    );
  }
}





