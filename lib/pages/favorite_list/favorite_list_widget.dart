import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';
import 'package:v_v_p_swami/audio_helpers/player_invoke.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/like_unlike/like_unlike_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'favorite_list_model.dart';
export 'favorite_list_model.dart';

class FavoriteListWidget extends StatefulWidget {
  const FavoriteListWidget({super.key});

  static String routeName = 'FavoriteList';
  static String routePath = '/favoriteList';

  @override
  State<FavoriteListWidget> createState() => _FavoriteListWidgetState();
}

class _FavoriteListWidgetState extends State<FavoriteListWidget>
    with TickerProviderStateMixin {
  late FavoriteListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FavoriteList'});
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

    return SafeArea(
      child: FutureBuilder<ApiCallResponse>(
        future: LaravelGroup.likedPostsListCall.call(
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
          final favoriteListLikedPostsListResponse = snapshot.data!;
      
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
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  'FAVORITE_LIST_chevron_left_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.pop();
                            },
                          ),
                          AutoSizeText(
                            FFLocalizations.of(context).getText(
                              'qrqdecbl' /* Favorite */,
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
                          Container(
                            width: 60.0,
                            decoration: BoxDecoration(),
                          ),
                        ],
                      ),
                      if (true)
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
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                                        'mk12tkv5' /* Audio */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'rknf8ax9' /* Prabhupada */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'koxaun3y' /* Video */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'nq8ruoge' /* News */,
                                      ),
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [
                                          () async {},
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
                                            .likedPostsListCall
                                            .dataList(
                                          favoriteListLikedPostsListResponse
                                              .jsonBody,
                                        )
                                            ?.where((e) =>
                                        functions.jsonToint(
                                            e, 'post_type_id') ==
                                            1)
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
                                          itemBuilder: (context, audioListIndex) {
                                            final audioListItem =
                                            audioList[audioListIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(20.0, 8.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(14.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
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
                                                            'FAVORITE_LIST_PAGE_Row_sj9i67pp_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_update_app_state');
                                                        FFAppState().audioUrl =
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
                                                                .likedPostsListCall
                                                                .dataList(
                                                              favoriteListLikedPostsListResponse
                                                                  .jsonBody,
                                                            )!
                                                                .where((e) =>
                                                            functions
                                                                .jsonToint(
                                                                e,
                                                                'post_type_id') ==
                                                                1)
                                                                .toList()
                                                                .cast<dynamic>();
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');
      
                                                        playerPlayProcessDebounce(
                                                          audioList
                                                              .map((sObj) => {
                                                            'id': sObj[
                                                            "id"]
                                                                .toString(),
                                                            'title': sObj[
                                                            "title"]
                                                                .toString(),
                                                            'artist': sObj[
                                                            "author"]
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
                                                            'user_id': sObj[
                                                            "artistsId"]
                                                                .toString(),
                                                            'user_name': sObj[
                                                            "artists"]
                                                                .toString(),
                                                            'extra': {
                                                              'json':
                                                              sObj,
                                                              'date': sObj[
                                                              "date"]
                                                                  .toString(),
                                                              'country': sObj[
                                                              "country"]
                                                                  .toString(),
                                                              'city': sObj[
                                                              "city"]
                                                                  .toString(),
                                                            },
                                                          })
                                                              .toList(),
                                                          audioListIndex,
                                                        );
                                                        Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            opaque: false,
                                                            pageBuilder: (_, ___,
                                                                __) =>
                                                            const MainPlayerView(),
                                                          ),
                                                        );
                                                        // context.pushNamed(
                                                        //   'NowPlayingPage',
                                                        //   queryParameters: {
                                                        //     'currentAudio':
                                                        //         serializeParam(
                                                        //       audioListItem,
                                                        //       ParamType.JSON,
                                                        //     ),
                                                        //     'chapters':
                                                        //         serializeParam(
                                                        //       LaravelGroup
                                                        //           .likedPostsListCall
                                                        //           .dataList(
                                                        //             favoriteListLikedPostsListResponse
                                                        //                 .jsonBody,
                                                        //           )
                                                        //           ?.where((e) =>
                                                        //               functions
                                                        //                   .jsonToint(
                                                        //                       e,
                                                        //                       'post_type_id') ==
                                                        //               1)
                                                        //           .toList(),
                                                        //       ParamType.JSON,
                                                        //       isList: true,
                                                        //     ),
                                                        //     'currentAudioIndex':
                                                        //         serializeParam(
                                                        //       audioListIndex,
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
                                                            audioListItem,
                                                            r'''$.image''',
                                                          ) !=
                                                              null)
                                                            ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8.0),
                                                              child:
                                                              Image.network(
                                                                getJsonField(
                                                                  audioListItem,
                                                                  r'''$.image''',
                                                                ).toString(),
                                                                width: 104.0,
                                                                height: 104.0,
                                                                fit: BoxFit.cover,
                                                                errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                    Image.asset(
                                                                      'assets/images/error_image.png',
                                                                      width: 104.0,
                                                                      height: 104.0,
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
                                                              child: Image.asset(
                                                                'assets/images/AboutImage.png',
                                                                width: 104.0,
                                                                height: 104.0,
                                                                fit: BoxFit.cover,
                                                                alignment:
                                                                Alignment(
                                                                    -1.0,
                                                                    0.0),
                                                              ),
                                                            ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
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
                                                                    child: Row(
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
                                                                        Text(
                                                                          getJsonField(
                                                                            audioListItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                    MainAxisSize
                                                                        .max,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      if (getJsonField(
                                                                        audioListItem,
                                                                        r'''$.shloka_part''',
                                                                      ) !=
                                                                          null)
                                                                        Flexible(
                                                                          child:
                                                                          Text(
                                                                            functions.combineTextFromJson(
                                                                                getJsonField(
                                                                                  audioListItem,
                                                                                  r'''$.shloka_part''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  audioListItem,
                                                                                  r'''$.shloka_chapter''',
                                                                                ).toString()),
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
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
                                                                        ),
                                                                      if (getJsonField(
                                                                        audioListItem,
                                                                        r'''$.shloka_part''',
                                                                      ) !=
                                                                          null)
                                                                        SizedBox(
                                                                          height:
                                                                          16.0,
                                                                          child:
                                                                          VerticalDivider(
                                                                            thickness:
                                                                            1.0,
                                                                            color:
                                                                            Color(0xFF7ECBC9),
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
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                          height:
                                                                          16.0,
                                                                          child:
                                                                          VerticalDivider(
                                                                            thickness:
                                                                            1.0,
                                                                            color:
                                                                            Color(0xFF7ECBC9),
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                        audioListItem,
                                                                        r'''$.date''',
                                                                      ) !=
                                                                          null)
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            dateTimeFormat(
                                                                              "yyyy",
                                                                              functions.stringToDate(getJsonField(
                                                                                audioListItem,
                                                                                r'''$.date''',
                                                                              ).toString()),
                                                                              locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                    padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            color:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                            shape:
                                                                            BoxShape.rectangle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional
                                                                                .fromSTEB(
                                                                                6.0,
                                                                                3.0,
                                                                                12.0,
                                                                                3.0),
                                                                            child:
                                                                            Row(
                                                                              mainAxisSize:
                                                                              MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.play_arrow,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  size: 18.0,
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'oklvzehp' /* Play */,
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
                                                                              key:
                                                                              Key('Keygz7_${audioListIndex}_of_${audioList.length}'),
                                                                              post:
                                                                              audioListItem,
                                                                            ),
                                                                            InkWell(
                                                                              splashColor:
                                                                              Colors.transparent,
                                                                              focusColor:
                                                                              Colors.transparent,
                                                                              hoverColor:
                                                                              Colors.transparent,
                                                                              highlightColor:
                                                                              Colors.transparent,
                                                                              onTap:
                                                                                  () async {
                                                                                logFirebaseEvent('FAVORITE_LIST_Container_wq1d948h_ON_TAP');
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
                                                                              child:
                                                                              Container(
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
                                                                              splashColor:
                                                                              Colors.transparent,
                                                                              focusColor:
                                                                              Colors.transparent,
                                                                              hoverColor:
                                                                              Colors.transparent,
                                                                              highlightColor:
                                                                              Colors.transparent,
                                                                              onTap:
                                                                                  () async {
                                                                                logFirebaseEvent('FAVORITE_LIST_Container_e12mcay3_ON_TAP');
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
                                                                              child:
                                                                              Container(
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
                                                                            if (FFAppConstants
                                                                                .HideShare)
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('FAVORITE_LIST_Container_epl1vcm7_ON_TAP');
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
                                                                ].divide(
                                                                    const SizedBox(
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
                                                      color: Color(0xFFD9D9D9),
                                                    ),
                                                  ].divide(const SizedBox(
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
                                        final prabhupadaList = LaravelGroup
                                            .likedPostsListCall
                                            .dataList(
                                          favoriteListLikedPostsListResponse
                                              .jsonBody,
                                        )
                                            ?.where((e) =>
                                        functions.jsonToint(
                                            e, 'post_type_id') ==
                                            3)
                                            .toList()
                                            .toList() ??
                                            [];
                                        if (prabhupadaList.isEmpty) {
                                          return EmptyWidget();
                                        }
      
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: prabhupadaList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, prabhupadaListIndex) {
                                            final prabhupadaListItem =
                                            prabhupadaList[
                                            prabhupadaListIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(20.0, 8.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(14.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
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
                                                            'FAVORITE_LIST_PAGE_Row_rfkemift_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_update_app_state');
                                                        FFAppState().audioUrl =
                                                            getJsonField(
                                                              prabhupadaListItem,
                                                              r'''$.data''',
                                                            ).toString();
                                                        FFAppState()
                                                            .currentAudioTrack =
                                                            prabhupadaListItem;
                                                        FFAppState()
                                                            .AudioPlayerSongIndex =
                                                            prabhupadaListIndex;
                                                        FFAppState()
                                                            .AudioPlayerList =
                                                            LaravelGroup
                                                                .likedPostsListCall
                                                                .dataList(
                                                              favoriteListLikedPostsListResponse
                                                                  .jsonBody,
                                                            )!
                                                                .where((e) =>
                                                            functions
                                                                .jsonToint(
                                                                e,
                                                                'post_type_id') ==
                                                                3)
                                                                .toList()
                                                                .cast<dynamic>();
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');
      
                                                        playerPlayProcessDebounce(
                                                          prabhupadaList
                                                              .map((sObj) => {
                                                            'id': sObj[
                                                            "id"]
                                                                .toString(),
                                                            'title': sObj[
                                                            "title"]
                                                                .toString(),
                                                            'artist': sObj[
                                                            "author"]
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
                                                            'user_id': sObj[
                                                            "artistsId"]
                                                                .toString(),
                                                            'user_name': sObj[
                                                            "artists"]
                                                                .toString(),
                                                            'extra': {
                                                              'json':
                                                              sObj,
                                                              'date': sObj[
                                                              "date"]
                                                                  .toString(),
                                                              'country': sObj[
                                                              "country"]
                                                                  .toString(),
                                                              'city': sObj[
                                                              "city"]
                                                                  .toString(),
                                                            },
                                                          })
                                                              .toList(),
                                                          prabhupadaListIndex,
                                                        );
                                                        Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            opaque: false,
                                                            pageBuilder: (_, ___,
                                                                __) =>
                                                            const MainPlayerView(),
                                                          ),
                                                        );
                                                        // context.pushNamed(
                                                        //   'NowPlayingPage',
                                                        //   queryParameters: {
                                                        //     'currentAudio':
                                                        //         serializeParam(
                                                        //       prabhupadaListItem,
                                                        //       ParamType.JSON,
                                                        //     ),
                                                        //     'chapters':
                                                        //         serializeParam(
                                                        //       LaravelGroup
                                                        //           .likedPostsListCall
                                                        //           .dataList(
                                                        //             favoriteListLikedPostsListResponse
                                                        //                 .jsonBody,
                                                        //           )
                                                        //           ?.where((e) =>
                                                        //               functions
                                                        //                   .jsonToint(
                                                        //                       e,
                                                        //                       'post_type_id') ==
                                                        //               3)
                                                        //           .toList(),
                                                        //       ParamType.JSON,
                                                        //       isList: true,
                                                        //     ),
                                                        //     'currentAudioIndex':
                                                        //         serializeParam(
                                                        //       prabhupadaListIndex,
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
                                                            prabhupadaListItem,
                                                            r'''$.image''',
                                                          ) !=
                                                              null)
                                                            ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8.0),
                                                              child:
                                                              Image.network(
                                                                getJsonField(
                                                                  prabhupadaListItem,
                                                                  r'''$.image''',
                                                                ).toString(),
                                                                width: 104.0,
                                                                height: 104.0,
                                                                fit: BoxFit.cover,
                                                                errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                    Image.asset(
                                                                      'assets/images/error_image.png',
                                                                      width: 104.0,
                                                                      height: 104.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                              ),
                                                            ),
                                                          if (getJsonField(
                                                            prabhupadaListItem,
                                                            r'''$.image''',
                                                          ) ==
                                                              null)
                                                            ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8.0),
                                                              child: Image.asset(
                                                                'assets/images/AboutImage.png',
                                                                width: 104.0,
                                                                height: 104.0,
                                                                fit: BoxFit.cover,
                                                                alignment:
                                                                Alignment(
                                                                    -1.0,
                                                                    0.0),
                                                              ),
                                                            ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
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
                                                                    child: Row(
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
                                                                        Text(
                                                                          getJsonField(
                                                                            prabhupadaListItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                    MainAxisSize
                                                                        .max,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      if (getJsonField(
                                                                        prabhupadaListItem,
                                                                        r'''$.shloka_part''',
                                                                      ) !=
                                                                          null)
                                                                        Flexible(
                                                                          child:
                                                                          Text(
                                                                            functions.combineTextFromJson(
                                                                                getJsonField(
                                                                                  prabhupadaListItem,
                                                                                  r'''$.shloka_part''',
                                                                                ).toString(),
                                                                                getJsonField(
                                                                                  prabhupadaListItem,
                                                                                  r'''$.shloka_chapter''',
                                                                                ).toString()),
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
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
                                                                        ),
                                                                      if (getJsonField(
                                                                        prabhupadaListItem,
                                                                        r'''$.shloka_part''',
                                                                      ) !=
                                                                          null)
                                                                        SizedBox(
                                                                          height:
                                                                          16.0,
                                                                          child:
                                                                          VerticalDivider(
                                                                            thickness:
                                                                            1.0,
                                                                            color:
                                                                            Color(0xFF7ECBC9),
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                        prabhupadaListItem,
                                                                        r'''$.city''',
                                                                      ) !=
                                                                          null)
                                                                        Text(
                                                                          getJsonField(
                                                                            prabhupadaListItem,
                                                                            r'''$.city''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        prabhupadaListItem,
                                                                        r'''$.city''',
                                                                      ) !=
                                                                          null) &&
                                                                          (getJsonField(
                                                                            prabhupadaListItem,
                                                                            r'''$.date''',
                                                                          ) !=
                                                                              null))
                                                                        SizedBox(
                                                                          height:
                                                                          16.0,
                                                                          child:
                                                                          VerticalDivider(
                                                                            thickness:
                                                                            1.0,
                                                                            color:
                                                                            Color(0xFF7ECBC9),
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                        prabhupadaListItem,
                                                                        r'''$.date''',
                                                                      ) !=
                                                                          null)
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            dateTimeFormat(
                                                                              "yyyy",
                                                                              functions.stringToDate(getJsonField(
                                                                                prabhupadaListItem,
                                                                                r'''$.date''',
                                                                              ).toString()),
                                                                              locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                    padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            color:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                            shape:
                                                                            BoxShape.rectangle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional
                                                                                .fromSTEB(
                                                                                6.0,
                                                                                3.0,
                                                                                12.0,
                                                                                3.0),
                                                                            child:
                                                                            Row(
                                                                              mainAxisSize:
                                                                              MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.play_arrow,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  size: 18.0,
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'rprgngwb' /* Play */,
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
                                                                            mainAxisSize:
                                                                            MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                            children:
                                                                            [
                                                                              LikeUnlikeWidget(
                                                                                key: Key('Keyufx_${prabhupadaListIndex}_of_${prabhupadaList.length}'),
                                                                                post: prabhupadaListItem,
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('FAVORITE_LIST_Container_h6i132nv_ON_TAP');
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
                                                                                              post: prabhupadaListItem,
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
                                                                                  logFirebaseEvent('FAVORITE_LIST_Container_6oz36l72_ON_TAP');
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
                                                                                              post: prabhupadaListItem,
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
                                                                                    logFirebaseEvent('FAVORITE_LIST_Container_ra38p12t_ON_TAP');
                                                                                    logFirebaseEvent('Container_action_block');
                                                                                    await action_blocks.allShare(
                                                                                      context,
                                                                                      url: getJsonField(
                                                                                        prabhupadaListItem,
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
                                                                ].divide(
                                                                    const SizedBox(
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
                                                      color: Color(0xFFD9D9D9),
                                                    ),
                                                  ].divide(const SizedBox(
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
                                            .likedPostsListCall
                                            .dataList(
                                          favoriteListLikedPostsListResponse
                                              .jsonBody,
                                        )
                                            ?.where((e) =>
                                        functions.jsonToint(
                                            e, 'post_type_id') ==
                                            7)
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
                                          itemBuilder: (context, videoListIndex) {
                                            final videoListItem =
                                            videoList[videoListIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(20.0, 8.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(14.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
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
                                                            'FAVORITE_LIST_PAGE_Row_kr7ns5jn_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');
      
                                                        context.pushNamed(
                                                          VideoPostWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'videoItem':
                                                            serializeParam(
                                                              videoListItem,
                                                              ParamType.JSON,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                            child: Image.network(
                                                              getJsonField(
                                                                videoListItem,
                                                                r'''$.image''',
                                                              ).toString(),
                                                              width: 144.0,
                                                              height: 82.0,
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                                  Image.asset(
                                                                    'assets/images/error_image.png',
                                                                    width: 144.0,
                                                                    height: 82.0,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
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
                                                                    child: Row(
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
                                                                        Text(
                                                                          getJsonField(
                                                                            videoListItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                    padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            color:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                            borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                            shape:
                                                                            BoxShape.rectangle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional
                                                                                .fromSTEB(
                                                                                6.0,
                                                                                3.0,
                                                                                12.0,
                                                                                3.0),
                                                                            child:
                                                                            Row(
                                                                              mainAxisSize:
                                                                              MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.play_arrow,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  size: 18.0,
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '7vzdv83f' /* Play */,
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
                                                                              key:
                                                                              Key('Keyxi9_${videoListIndex}_of_${videoList.length}'),
                                                                              post:
                                                                              videoListItem,
                                                                            ),
                                                                            InkWell(
                                                                              splashColor:
                                                                              Colors.transparent,
                                                                              focusColor:
                                                                              Colors.transparent,
                                                                              hoverColor:
                                                                              Colors.transparent,
                                                                              highlightColor:
                                                                              Colors.transparent,
                                                                              onTap:
                                                                                  () async {
                                                                                logFirebaseEvent('FAVORITE_LIST_Container_13vjluyy_ON_TAP');
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
                                                                              child:
                                                                              Container(
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
                                                                              splashColor:
                                                                              Colors.transparent,
                                                                              focusColor:
                                                                              Colors.transparent,
                                                                              hoverColor:
                                                                              Colors.transparent,
                                                                              highlightColor:
                                                                              Colors.transparent,
                                                                              onTap:
                                                                                  () async {
                                                                                logFirebaseEvent('FAVORITE_LIST_Container_3lhfrnor_ON_TAP');
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
                                                                              child:
                                                                              Container(
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
                                                                            if (FFAppConstants
                                                                                .HideShare)
                                                                              Builder(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('FAVORITE_LIST_Container_hy749qc0_ON_TAP');
                                                                                    logFirebaseEvent('Container_share');
                                                                                    await Share.share(
                                                                                      getJsonField(
                                                                                        videoListItem,
                                                                                        r'''$.data''',
                                                                                      ).toString(),
                                                                                      sharePositionOrigin: getWidgetBoundingBox(context),
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
                                                                ].divide(
                                                                    const SizedBox(
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
                                                      color: Color(0xFFD9D9D9),
                                                    ),
                                                  ].divide(const SizedBox(
                                                      height: 8.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 8.0, 20.0, 18.0),
                                      child: Builder(
                                        builder: (context) {
                                          final news = LaravelGroup
                                              .likedPostsListCall
                                              .dataList(
                                            favoriteListLikedPostsListResponse
                                                .jsonBody,
                                          )
                                              ?.where((e) =>
                                          functions.jsonToint(
                                              e, 'post_type_id') ==
                                              13)
                                              .toList()
                                              .toList() ??
                                              [];
                                          if (news.isEmpty) {
                                            return EmptyWidget();
                                          }
      
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: news.length,
                                            itemBuilder: (context, newsIndex) {
                                              final newsItem = news[newsIndex];
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      4.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
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
                                                          'FAVORITE_LIST_PAGE_Row_gdytufkt_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');
      
                                                      context.pushNamed(
                                                        BlogPostWidget.routeName,
                                                        queryParameters: {
                                                          'blogPost':
                                                          serializeParam(
                                                            newsItem,
                                                            ParamType.JSON,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(8.0),
                                                          child: Image.network(
                                                            getJsonField(
                                                              newsItem,
                                                              r'''$.image''',
                                                            ).toString(),
                                                            width: 80.0,
                                                            height: 80.0,
                                                            fit: BoxFit.cover,
                                                            alignment: Alignment(
                                                                -1.0, 0.0),
                                                            errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                                Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 80.0,
                                                                  height: 80.0,
                                                                  fit: BoxFit.cover,
                                                                  alignment:
                                                                  Alignment(
                                                                      -1.0, 0.0),
                                                                ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsetsDirectional
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
                                                                  child: Row(
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                        Text(
                                                                          getJsonField(
                                                                            newsItem,
                                                                            r'''$.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            font: GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: Color(0xFF232323),
                                                                            fontSize: 18.0,
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FontWeight.w600,
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
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Flexible(
                                                                      child: Text(
                                                                        getJsonField(
                                                                          newsItem,
                                                                          r'''$.author''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(
                                                                            context)
                                                                            .bodyLarge
                                                                            .override(
                                                                          font:
                                                                          GoogleFonts.poppins(
                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                          14.0,
                                                                          letterSpacing:
                                                                          0.0,
                                                                          fontWeight:
                                                                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                          fontStyle:
                                                                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                      25.0,
                                                                      child:
                                                                      VerticalDivider(
                                                                        thickness:
                                                                        1.0,
                                                                        color: Color(
                                                                            0xFF7ECBC9),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          "yyyy",
                                                                          functions
                                                                              .stringToDate(getJsonField(
                                                                            newsItem,
                                                                            r'''$.date''',
                                                                          ).toString()),
                                                                          locale:
                                                                          FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '-',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                          context)
                                                                          .bodyMedium
                                                                          .override(
                                                                        font:
                                                                        GoogleFonts.poppins(
                                                                          fontWeight:
                                                                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle:
                                                                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                        color:
                                                                        FlutterFlowTheme.of(context).backGrey,
                                                                        fontSize:
                                                                        14.0,
                                                                        letterSpacing:
                                                                        0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                      25.0,
                                                                      child:
                                                                      VerticalDivider(
                                                                        thickness:
                                                                        1.0,
                                                                        color: Color(
                                                                            0xFF7ECBC9),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                      LikeUnlikeWidget(
                                                                        key: Key(
                                                                            'Keyp0k_${newsIndex}_of_${news.length}'),
                                                                        post:
                                                                        newsItem,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
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
                            ],
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
      ),
    );
  }
}
