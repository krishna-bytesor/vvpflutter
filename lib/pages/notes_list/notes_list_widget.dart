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
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notes_list_model.dart';
export 'notes_list_model.dart';

class NotesListWidget extends StatefulWidget {
  const NotesListWidget({super.key});

  static String routeName = 'NotesList';
  static String routePath = '/notesList';

  @override
  State<NotesListWidget> createState() => _NotesListWidgetState();
}

class _NotesListWidgetState extends State<NotesListWidget>
    with TickerProviderStateMixin {
  late NotesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NotesList'});
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

    return FutureBuilder<ApiCallResponse>(
      future: LaravelGroup.notesListCall.call(
        token: FFAppState().Token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).oldLace,
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
        final notesListNotesListResponse = snapshot.data!;

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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
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
                                        'NOTES_LIST_PAGE_chevron_left_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.pop();
                                  },
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'h7h494zj' /* Notes */,
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
                                      unselectedLabelColor:
                                          const Color(0xFF436073),
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
                                            'lpwabci5' /* Audio */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                             '8u64zgm6' /* Prabhupada */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ophukpt1' /* Video */,
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
                                            final audios = LaravelGroup
                                                    .notesListCall
                                                    .notesList(
                                                      notesListNotesListResponse
                                                          .jsonBody,
                                                    )
                                                    ?.where((e) =>
                                                        functions.jsonToint(
                                                            getJsonField(
                                                              e,
                                                              r'''$.post''',
                                                            ),
                                                            'post_type_id') ==
                                                        1)
                                                    .toList()
                                                    .toList() ??
                                                [];
                                            if (audios.isEmpty) {
                                              return EmptyWidget();
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: audios.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 8.0),
                                              itemBuilder:
                                                  (context, audiosIndex) {
                                                final audiosItem =
                                                    audios[audiosIndex];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
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
                                                            FFAppState()
                                                                    .audioUrl =
                                                                getJsonField(
                                                              audiosItem,
                                                              r'''$.post.data''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .currentAudioTrack =
                                                                getJsonField(
                                                              audiosItem,
                                                              r'''$.post''',
                                                            );
                                                            FFAppState()
                                                                    .AudioPlayerSongIndex =
                                                                audiosIndex;
                                                            FFAppState()
                                                                    .AudioPlayerList =
                                                                functions
                                                                    .jsontoListJson(
                                                                        getJsonField(
                                                                      audiosItem,
                                                                      r'''$.post''',
                                                                    ))
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            safeSetState(() {});
                                                            //   logFirebaseEvent(
                                                            //       'Row_navigate_to');

                                                            //   context.pushNamed(
                                                            //     'NowPlayingPage',
                                                            //     queryParameters: {
                                                            //       'currentAudio':
                                                            //           serializeParam(
                                                            //         getJsonField(
                                                            //           audiosItem,
                                                            //           r'''$.post''',
                                                            //         ),
                                                            //         ParamType
                                                            //             .JSON,
                                                            //       ),
                                                            //       'chapters':
                                                            //           serializeParam(
                                                            //         functions
                                                            //             .jsontoListJson(
                                                            //                 getJsonField(
                                                            //           audiosItem,
                                                            //           r'''$.post''',
                                                            //         )),
                                                            //         ParamType
                                                            //             .JSON,
                                                            //         isList: true,
                                                            //       ),
                                                            //       'currentAudioIndex':
                                                            //           serializeParam(
                                                            //         audiosIndex,
                                                            //         ParamType.int,
                                                            //       ),
                                                            //     }.withoutNulls,
                                                            //   );
                                                            playerPlayProcessDebounce(
                                                              audios
                                                                  .map((sObj) {
                                                                final post = sObj[
                                                                    'post']; // Access the 'post' object from 'sObj'

                                                                return {
                                                                  'id': post[
                                                                          'id']
                                                                      .toString(), // Access top-level field
                                                                  'title': post?[
                                                                              'title']
                                                                          ?.toString() ??
                                                                      'Unknown', // Access nested post fields
                                                                  'artist': post?[
                                                                              'author']
                                                                          ?.toString() ??
                                                                      'Unknown',
                                                                  'album': post?[
                                                                              'shloka_chapter']
                                                                          ?.toString() ??
                                                                      'Unknown',
                                                                  'genre': post?[
                                                                              'language']
                                                                          ?.toString() ??
                                                                      'Unknown',
                                                                  'image': post?[
                                                                              'image']
                                                                          ?.toString() ??
                                                                      '',
                                                                  'url': post?[
                                                                              'data']
                                                                          ?.toString() ??
                                                                      '',
                                                                  'user_id': sObj[
                                                                          'user_id']
                                                                      .toString(), // Access top-level field
                                                                  'user_name': post?[
                                                                              'author']
                                                                          ?.toString() ??
                                                                      'Unknown', // Use author for user_name
                                                                  'extra': {
                                                                    'json':
                                                                        post, // Include the full original object
                                                                    'date': post?['date']
                                                                            ?.toString() ??
                                                                        'Unknown',
                                                                    'country': post?['country']
                                                                            ?.toString() ??
                                                                        'Unknown',
                                                                    'city': post?['city']
                                                                            ?.toString() ??
                                                                        'Unknown',
                                                                  },
                                                                };
                                                              }).toList(),
                                                              // {
                                                              //   'id':
                                                              //       sObj.post["id"].toString(),
                                                              //   'title':
                                                              //       sObj["title"].toString(),
                                                              //   'artist':
                                                              //       sObj["author"].toString(),
                                                              //   'album':
                                                              //       sObj["album"].toString(),
                                                              //   'genre':
                                                              //       sObj["language"].toString(),
                                                              //   'image':
                                                              //       sObj["image"].toString(),
                                                              //   'url':
                                                              //       sObj["data"].toString(),
                                                              //   'user_id':
                                                              //       sObj["artistsId"].toString(),
                                                              //   'user_name':
                                                              //       sObj["artists"].toString(),
                                                              //   'extra':
                                                              //       {
                                                              //     'json': sObj,
                                                              //     'date': sObj.post["date"].toString(),
                                                              //     'country': sObj["country"].toString(),
                                                              //     'city': sObj["city"].toString(),
                                                              //   },
                                                              // })
                                                              // .toList(),
                                                              audiosIndex,
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
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    audiosItem,
                                                                    r'''$.post.image''',
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
                                                              Flexible(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
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
                                                                                audiosItem,
                                                                                r'''$.post.title''',
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
                                                                                audiosItem,
                                                                                r'''$.post.shloka_part''',
                                                                              ) !=
                                                                              null)
                                                                            Flexible(
                                                                              child: Text(
                                                                                functions.combineTextFromJson(
                                                                                    getJsonField(
                                                                                      audiosItem,
                                                                                      r'''$.post.shloka_part''',
                                                                                    ).toString(),
                                                                                    getJsonField(
                                                                                      audiosItem,
                                                                                      r'''$.post.shloka_chapter''',
                                                                                    ).toString()),
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
                                                                            ),
                                                                              SizedBox(
                                                                                height: 16.0,
                                                                                child: VerticalDivider(
                                                                                  thickness: 1.0,
                                                                                  color: Color(0xFF7ECBC9),
                                                                                ),
                                                                              ),
                                                                          if (getJsonField(
                                                                                audiosItem,
                                                                                r'''$.post.country''',
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
                                                                                audiosItem,
                                                                                r'''$.post.city''',
                                                                              ) !=
                                                                              null)
                                                                            Text(
                                                                              getJsonField(
                                                                                audiosItem,
                                                                                r'''$.post.city''',
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
                                                                                    audiosItem,
                                                                                    r'''$.post.city''',
                                                                                  ) !=
                                                                                  null) &&
                                                                              (getJsonField(
                                                                                    audiosItem,
                                                                                    r'''$.post.date''',
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
                                                                                audiosItem,
                                                                                r'''$.post.date''',
                                                                              ) !=
                                                                              null)
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                dateTimeFormat(
                                                                                  "yyyy",
                                                                                  functions.stringToDate(getJsonField(
                                                                                    audiosItem,
                                                                                    r'''$.post.date''',
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
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
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
                                                                                        'xi7nlu25' /* Play */,
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
                                                                                LikeUnlikeWidget(
                                                                                  key: Key('Keyhwx_${audiosIndex}_of_${audios.length}'),
                                                                                  post: getJsonField(
                                                                                    audiosItem,
                                                                                    r'''$.post''',
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('NOTES_LIST_Container_qncv57ee_ON_TAP');
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
                                                                                                post: getJsonField(
                                                                                                  audiosItem,
                                                                                                  r'''$.post''',
                                                                                                ),
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
                                                                                    logFirebaseEvent('NOTES_LIST_Container_k6bzyby2_ON_TAP');
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
                                                                                                post: getJsonField(
                                                                                                  audiosItem,
                                                                                                  r'''$.post''',
                                                                                                ),
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
                                                                                      logFirebaseEvent('NOTES_LIST_Container_xo9q73rz_ON_TAP');
                                                                                      logFirebaseEvent('Container_action_block');
                                                                                      await action_blocks.allShare(
                                                                                        context,
                                                                                        url: getJsonField(
                                                                                          audiosItem,
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
                                            final prabhupadaList = LaravelGroup
                                                    .notesListCall
                                                    .notesList(
                                                      notesListNotesListResponse
                                                          .jsonBody,
                                                    )
                                                    ?.where((e) =>
                                                        functions.jsonToint(
                                                            getJsonField(
                                                              e,
                                                              r'''$.post''',
                                                            ),
                                                            'post_type_id') ==
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
                                              itemBuilder: (context,
                                                  prabhupadaListIndex) {
                                                final prabhupadaListItem =
                                                    prabhupadaList[
                                                        prabhupadaListIndex];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
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
                                                                'NOTES_LIST_PAGE_Row_4w7r1193_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Row_update_app_state');
                                                            FFAppState()
                                                                    .audioUrl =
                                                                getJsonField(
                                                              prabhupadaListItem,
                                                              r'''$.post.data''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .currentAudioTrack =
                                                                getJsonField(
                                                              prabhupadaListItem,
                                                              r'''$.post''',
                                                            );
                                                            FFAppState()
                                                                    .AudioPlayerSongIndex =
                                                                prabhupadaListIndex;
                                                            FFAppState()
                                                                    .AudioPlayerList =
                                                                functions
                                                                    .jsontoListJson(
                                                                        getJsonField(
                                                                      prabhupadaListItem,
                                                                      r'''$.post''',
                                                                    ))
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            safeSetState(() {});
                                                            playerPlayProcessDebounce(
                                                              prabhupadaList
                                                                  .map((sObj) {
                                                                final post = sObj[
                                                                    'post']; // Access the 'post' object from 'sObj'

                                                                return {
                                                                  'id': post[
                                                                          'id']
                                                                      .toString(), // Access top-level field
                                                                  'title': post?[
                                                                              'title']
                                                                          ?.toString() ??
                                                                      'Unknown', // Access nested post fields
                                                                  'artist': post?[
                                                                              'author']
                                                                          ?.toString() ??
                                                                      'Unknown',
                                                                  'album': post?[
                                                                              'shloka_chapter']
                                                                          ?.toString() ??
                                                                      'Unknown',
                                                                  'genre': post?[
                                                                              'language']
                                                                          ?.toString() ??
                                                                      'Unknown',
                                                                  'image': post?[
                                                                              'image']
                                                                          ?.toString() ??
                                                                      '',
                                                                  'url': post?[
                                                                              'data']
                                                                          ?.toString() ??
                                                                      '',
                                                                  'user_id': sObj[
                                                                          'user_id']
                                                                      .toString(), // Access top-level field
                                                                  'user_name': post?[
                                                                              'author']
                                                                          ?.toString() ??
                                                                      'Unknown', // Use author for user_name
                                                                  'extra': {
                                                                    'json':
                                                                        post, // Include the full original object
                                                                    'date': post?['date']
                                                                            ?.toString() ??
                                                                        'Unknown',
                                                                    'country': post?['country']
                                                                            ?.toString() ??
                                                                        'Unknown',
                                                                    'city': post?['city']
                                                                            ?.toString() ??
                                                                        'Unknown',
                                                                  },
                                                                };
                                                              }).toList(),
                                                              prabhupadaListIndex,
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
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    prabhupadaListItem,
                                                                    r'''$.post.image''',
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
                                                              Flexible(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
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
                                                                                prabhupadaListItem,
                                                                                r'''$.post.title''',
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
                                                                                prabhupadaListItem,
                                                                                r'''$.post.shloka_part''',
                                                                              ) !=
                                                                              null)
                                                                            Flexible(
                                                                              child: Text(
                                                                                functions.combineTextFromJson(
                                                                                    getJsonField(
                                                                                      prabhupadaListItem,
                                                                                      r'''$.post.shloka_part''',
                                                                                    ).toString(),
                                                                                    getJsonField(
                                                                                      prabhupadaListItem,
                                                                                      r'''$.post.shloka_chapter''',
                                                                                    ).toString()),
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
                                                                            ),
                                                                          if (getJsonField(
                                                                                prabhupadaListItem,
                                                                                r'''$.post.shloka_part''',
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
                                                                                prabhupadaListItem,
                                                                                r'''$.post.city''',
                                                                              ) !=
                                                                              null)
                                                                            Text(
                                                                              getJsonField(
                                                                                prabhupadaListItem,
                                                                                r'''$.post.city''',
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
                                                                                    prabhupadaListItem,
                                                                                    r'''$.post.city''',
                                                                                  ) !=
                                                                                  null) &&
                                                                              (getJsonField(
                                                                                    prabhupadaListItem,
                                                                                    r'''$.post.date''',
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
                                                                                prabhupadaListItem,
                                                                                r'''$.post.date''',
                                                                              ) !=
                                                                              null)
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                dateTimeFormat(
                                                                                  "yyyy",
                                                                                  functions.stringToDate(getJsonField(
                                                                                    prabhupadaListItem,
                                                                                    r'''$.post.date''',
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
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
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
                                                                                        'o5r6d5tz' /* Play */,
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
                                                                                LikeUnlikeWidget(
                                                                                  key: Key('Keycfv_${prabhupadaListIndex}_of_${prabhupadaList.length}'),
                                                                                  post: getJsonField(
                                                                                    prabhupadaListItem,
                                                                                    r'''$.post''',
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('NOTES_LIST_Container_2hm4xaip_ON_TAP');
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
                                                                                                post: getJsonField(
                                                                                                  prabhupadaListItem,
                                                                                                  r'''$.post''',
                                                                                                ),
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
                                                                                    logFirebaseEvent('NOTES_LIST_Container_myytigqk_ON_TAP');
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
                                                                                                post: getJsonField(
                                                                                                  prabhupadaListItem,
                                                                                                  r'''$.post''',
                                                                                                ),
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
                                                                                      logFirebaseEvent('NOTES_LIST_Container_72jg1pvu_ON_TAP');
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
                                                    .notesListCall
                                                    .notesList(
                                                      notesListNotesListResponse
                                                          .jsonBody,
                                                    )
                                                    ?.where((e) =>
                                                        functions.jsonToint(
                                                            getJsonField(
                                                              e,
                                                              r'''$.post''',
                                                            ),
                                                            'post_type_id') ==
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
                                              itemBuilder:
                                                  (context, videoListIndex) {
                                                final videoListItem =
                                                    videoList[videoListIndex];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
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
                                                                'NOTES_LIST_PAGE_Row_8klxocya_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Row_navigate_to');

                                                            context.pushNamed(
                                                              VideoPostWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'videoItem':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    videoListItem,
                                                                    r'''$.post''',
                                                                  ),
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
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    videoListItem,
                                                                    r'''$.post.image''',
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
                                                              Flexible(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
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
                                                                                r'''$.post.title''',
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
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
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
                                                                                        'g9lsiqnq' /* Play */,
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
                                                                                LikeUnlikeWidget(
                                                                                  key: Key('Keyrgb_${videoListIndex}_of_${videoList.length}'),
                                                                                  post: getJsonField(
                                                                                    videoListItem,
                                                                                    r'''$.post''',
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('NOTES_LIST_Container_eryqc93a_ON_TAP');
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
                                                                                                post: getJsonField(
                                                                                                  videoListItem,
                                                                                                  r'''$.post''',
                                                                                                ),
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
                                                                                    logFirebaseEvent('NOTES_LIST_Container_qrlvs6b8_ON_TAP');
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
                                                                                                post: getJsonField(
                                                                                                  videoListItem,
                                                                                                  r'''$.post''',
                                                                                                ),
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
                                                                                if (FFAppConstants.HideShare)
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('NOTES_LIST_Container_78adtrex_ON_TAP');
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
      },
    );
  }
}





