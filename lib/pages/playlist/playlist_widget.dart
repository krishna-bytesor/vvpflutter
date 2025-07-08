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
import 'playlist_model.dart';
export 'playlist_model.dart';

import '../../audio_helpers/player_invoke.dart';
import '../../audio_helpers/main_player/main_player.dart';
import '../../audio_helpers/audio_handler.dart';
import '../../audio_helpers/mediaitem_converter.dart';
import '../../audio_helpers/page_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:audio_service/audio_service.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({
    super.key,
    required this.playlistItem,
  });

  final dynamic playlistItem;

  static String routeName = 'Playlist';
  static String routePath = '/Playlist';

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget>
    with TickerProviderStateMixin {
  late PlaylistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<String> getPlayableUrl(dynamic url) async {
    final urlStr = url.toString();
    if (urlStr.contains('youtube.com') || urlStr.contains('youtu.be')) {
      final yt = YoutubeExplode();
      try {
        final videoId = VideoId(urlStr);
        final manifest = await yt.videos.streamsClient.getManifest(videoId);
        final audioStreamInfo = manifest.audioOnly.withHighestBitrate();
        yt.close();
        return audioStreamInfo.url.toString();
      } catch (e) {
        yt.close();
        return urlStr;
      }
    }
    return urlStr;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Playlist'});
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

    return SafeArea(
      child: FutureBuilder<ApiCallResponse>(
        future: LaravelGroup.playlistItemsCall.call(
          token: FFAppState().Token,
          id: getJsonField(
            widget.playlistItem,
            r'''$.id''',
          ).toString(),
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
          final playlistPlaylistItemsResponse = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          'PLAYLIST_PAGE_chevron_left_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.pop();
                                    },
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      getJsonField(
                                        widget.playlistItem,
                                        r'''$.name''',
                                      ).toString(),
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
                                              'b2ll1ccw' /* Audio */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'ou3rfk1n' /* Prabhupada */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'oq1g9v1q' /* Video */,
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
                                                      .playlistItemsCall
                                                      .dataList(
                                                        playlistPlaylistItemsResponse
                                                            .jsonBody,
                                                      )
                                                      ?.where((e) =>
                                                          functions.jsonToint(e,
                                                              'post_type_id') ==
                                                          1)
                                                      .toList()
                                                      .map((e) => e)
                                                      .toList()
                                                      .toList() ??
                                                  [];
                                              if (audios.isEmpty) {
                                                return EmptyWidget();
                                              }

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 8.0,
                                                                20.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              // Open MainPlayerView immediately as a modal overlay
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(
                                                                PageRouteBuilder(
                                                                  opaque: false,
                                                                  pageBuilder: (_,
                                                                          __,
                                                                          ___) =>
                                                                      const MainPlayerView(),
                                                                ),
                                                              );
                                                              final pageManager =
                                                                  GetIt.I<
                                                                      PageManager>();
                                                              pageManager
                                                                  .setLoadingNewAudio(
                                                                      true);
                                                              pageManager
                                                                      .playButtonNotifier
                                                                      .value =
                                                                  ButtonState
                                                                      .loading;
                                                              pageManager
                                                                  .currentSongNotifier
                                                                  .value = null;
                                                              await pageManager
                                                                  .audioHandler
                                                                  .stop();
                                                              final urls = await Future.wait(audios.map((item) =>
                                                                  getPlayableUrl(
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.data'))));
                                                              final playlist =
                                                                  <MediaItem>[];
                                                              for (int i = 0;
                                                                  i <
                                                                      audios
                                                                          .length;
                                                                  i++) {
                                                                final item =
                                                                    audios[i];
                                                                final url =
                                                                    urls[i];
                                                                final itemMap =
                                                                    {
                                                                  'id': getJsonField(
                                                                      item,
                                                                      r'$.id'),
                                                                  'album':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.album'),
                                                                  'artist':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.author'),
                                                                  'duration':
                                                                      getJsonField(
                                                                              item,
                                                                              r'$.duration') ??
                                                                          180,
                                                                  'title':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.title'),
                                                                  'image':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.image'),
                                                                  'language':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.language'),
                                                                  'url': url,
                                                                  'user_id':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.artistsId'),
                                                                  'user_name':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.artists'),
                                                                  'album_id':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.album_id'),
                                                                  'extra': {
                                                                    'json':
                                                                        item,
                                                                    'date': getJsonField(
                                                                        item,
                                                                        r'$.date'),
                                                                    'country':
                                                                        getJsonField(
                                                                            item,
                                                                            r'$.country'),
                                                                    'city': getJsonField(
                                                                        item,
                                                                        r'$.city'),
                                                                  },
                                                                };
                                                                playlist.add(
                                                                    await MediaItemConverter
                                                                        .mapToMediaItem(
                                                                            itemMap));
                                                              }
                                                              await (pageManager
                                                                          .audioHandler
                                                                      as MyAudioHandler)
                                                                  .setNewPlaylist(
                                                                      playlist,
                                                                      audiosIndex);
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              // context.pushNamed(
                                                              //   NowPlayingPageWidget
                                                              //       .routeName,
                                                              //   queryParameters: {
                                                              //     'currentAudio':
                                                              //     serializeParam(
                                                              //       audiosItem,
                                                              //       ParamType
                                                              //           .JSON,
                                                              //     ),
                                                              //     'chapters':
                                                              //     serializeParam(
                                                              //       LaravelGroup
                                                              //           .playlistItemsCall
                                                              //           .dataList(
                                                              //         playlistPlaylistItemsResponse
                                                              //             .jsonBody,
                                                              //       )
                                                              //           ?.where((e) =>
                                                              //       functions.jsonToint(
                                                              //           e,
                                                              //           'post_type_id') ==
                                                              //           1)
                                                              //           .toList(),
                                                              //       ParamType
                                                              //           .JSON,
                                                              //       isList: true,
                                                              //     ),
                                                              //     'currentAudioIndex':
                                                              //     serializeParam(
                                                              //       audiosIndex,
                                                              //       ParamType.int,
                                                              //     ),
                                                              //   }.withoutNulls,
                                                              // );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(
                                                                      audiosItem,
                                                                      r'''$.image''',
                                                                    ) !=
                                                                    null)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      getJsonField(
                                                                        audiosItem,
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
                                                                      audiosItem,
                                                                      r'''$.image''',
                                                                    ) ==
                                                                    null)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
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
                                                                                  audiosItem,
                                                                                  r'''$.shloka_part''',
                                                                                ) !=
                                                                                null)
                                                                              Flexible(
                                                                                child: Text(
                                                                                  functions.combineTextFromJson(
                                                                                      getJsonField(
                                                                                        audiosItem,
                                                                                        r'''$.shloka_part''',
                                                                                      ).toString(),
                                                                                      getJsonField(
                                                                                        audiosItem,
                                                                                        r'''$.shloka_chapter''',
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
                                                                                  audiosItem,
                                                                                  r'''$.part''',
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
                                                                                  r'''$.city''',
                                                                                ) !=
                                                                                null)
                                                                              Text(
                                                                                getJsonField(
                                                                                  audiosItem,
                                                                                  r'''$.city''',
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
                                                                                      r'''$.city''',
                                                                                    ) !=
                                                                                    null) &&
                                                                                (getJsonField(
                                                                                      audiosItem,
                                                                                      r'''$.date''',
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
                                                                                  r'''$.date''',
                                                                                ) !=
                                                                                null)
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  dateTimeFormat(
                                                                                    "yyyy",
                                                                                    functions.stringToDate(getJsonField(
                                                                                      audiosItem,
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
                                                                                          '1zrptsoc' /* Play */,
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
                                                                                    key: Key('Key826_${audiosIndex}_of_${audios.length}'),
                                                                                    post: audiosItem,
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('PLAYLIST_PAGE_Container_julajj5l_ON_TAP');
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
                                                                                                  post: audiosItem,
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
                                                                                      logFirebaseEvent('PLAYLIST_PAGE_Container_565zwuhd_ON_TAP');
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
                                                                                                  post: audiosItem,
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
                                                                                        logFirebaseEvent('PLAYLIST_PAGE_Container_wqjjjjrk_ON_TAP');
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
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFD9D9D9),
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
                                                      .playlistItemsCall
                                                      .dataList(
                                                        playlistPlaylistItemsResponse
                                                            .jsonBody,
                                                      )
                                                      ?.where((e) =>
                                                          functions.jsonToint(e,
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
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    prabhupadaList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 8.0),
                                                itemBuilder: (context,
                                                    prabhupadaListIndex) {
                                                  final prabhupadaListItem =
                                                      prabhupadaList[
                                                          prabhupadaListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 8.0,
                                                                20.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              // Open MainPlayerView immediately as a modal overlay
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(
                                                                PageRouteBuilder(
                                                                  opaque: false,
                                                                  pageBuilder: (_,
                                                                          __,
                                                                          ___) =>
                                                                      const MainPlayerView(),
                                                                ),
                                                              );
                                                              final pageManager =
                                                                  GetIt.I<
                                                                      PageManager>();
                                                              pageManager
                                                                  .setLoadingNewAudio(
                                                                      true);
                                                              pageManager
                                                                      .playButtonNotifier
                                                                      .value =
                                                                  ButtonState
                                                                      .loading;
                                                              pageManager
                                                                  .currentSongNotifier
                                                                  .value = null;
                                                              await pageManager
                                                                  .audioHandler
                                                                  .stop();
                                                              final urls = await Future.wait(prabhupadaList.map((item) =>
                                                                  getPlayableUrl(
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.data'))));
                                                              final playlist =
                                                                  <MediaItem>[];
                                                              for (int i = 0;
                                                                  i <
                                                                      prabhupadaList
                                                                          .length;
                                                                  i++) {
                                                                final item =
                                                                    prabhupadaList[
                                                                        i];
                                                                final url =
                                                                    urls[i];
                                                                final itemMap =
                                                                    {
                                                                  'id': getJsonField(
                                                                      item,
                                                                      r'$.id'),
                                                                  'album':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.album'),
                                                                  'artist':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.author'),
                                                                  'duration':
                                                                      getJsonField(
                                                                              item,
                                                                              r'$.duration') ??
                                                                          180,
                                                                  'title':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.title'),
                                                                  'image':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.image'),
                                                                  'language':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.language'),
                                                                  'url': url,
                                                                  'user_id':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.artistsId'),
                                                                  'user_name':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.artists'),
                                                                  'album_id':
                                                                      getJsonField(
                                                                          item,
                                                                          r'$.album_id'),
                                                                  'extra': {
                                                                    'json':
                                                                        item,
                                                                    'date': getJsonField(
                                                                        item,
                                                                        r'$.date'),
                                                                    'country':
                                                                        getJsonField(
                                                                            item,
                                                                            r'$.country'),
                                                                    'city': getJsonField(
                                                                        item,
                                                                        r'$.city'),
                                                                  },
                                                                };
                                                                playlist.add(
                                                                    await MediaItemConverter
                                                                        .mapToMediaItem(
                                                                            itemMap));
                                                              }
                                                              await (pageManager
                                                                          .audioHandler
                                                                      as MyAudioHandler)
                                                                  .setNewPlaylist(
                                                                      playlist,
                                                                      prabhupadaListIndex);
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              // context.pushNamed(
                                                              //   NowPlayingPageWidget
                                                              //       .routeName,
                                                              //   queryParameters: {
                                                              //     'currentAudio':
                                                              //     serializeParam(
                                                              //       prabhupadaListItem,
                                                              //       ParamType
                                                              //           .JSON,
                                                              //     ),
                                                              //     'chapters':
                                                              //     serializeParam(
                                                              //       LaravelGroup
                                                              //           .playlistItemsCall
                                                              //           .dataList(
                                                              //         playlistPlaylistItemsResponse
                                                              //             .jsonBody,
                                                              //       )
                                                              //           ?.where((e) =>
                                                              //       functions.jsonToint(
                                                              //           e,
                                                              //           'post_type_id') ==
                                                              //           3)
                                                              //           .toList(),
                                                              //       ParamType
                                                              //           .JSON,
                                                              //       isList: true,
                                                              //     ),
                                                              //     'currentAudioIndex':
                                                              //     serializeParam(
                                                              //       prabhupadaListIndex,
                                                              //       ParamType.int,
                                                              //     ),
                                                              //   }.withoutNulls,
                                                              // );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(
                                                                      prabhupadaListItem,
                                                                      r'''$.image''',
                                                                    ) !=
                                                                    null)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      getJsonField(
                                                                        prabhupadaListItem,
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
                                                                      prabhupadaListItem,
                                                                      r'''$.image''',
                                                                    ) ==
                                                                    null)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
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
                                                                                  prabhupadaListItem,
                                                                                  r'''$.shloka_part''',
                                                                                ) !=
                                                                                null)
                                                                              Flexible(
                                                                                child: Text(
                                                                                  functions.combineTextFromJson(
                                                                                      getJsonField(
                                                                                        prabhupadaListItem,
                                                                                        r'''$.shloka_part''',
                                                                                      ).toString(),
                                                                                      getJsonField(
                                                                                        prabhupadaListItem,
                                                                                        r'''$.shloka_chapter''',
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
                                                                                  r'''$.part''',
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
                                                                                  r'''$.city''',
                                                                                ) !=
                                                                                null)
                                                                              Text(
                                                                                getJsonField(
                                                                                  prabhupadaListItem,
                                                                                  r'''$.city''',
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
                                                                                      r'''$.city''',
                                                                                    ) !=
                                                                                    null) &&
                                                                                (getJsonField(
                                                                                      prabhupadaListItem,
                                                                                      r'''$.date''',
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
                                                                                  r'''$.date''',
                                                                                ) !=
                                                                                null)
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  dateTimeFormat(
                                                                                    "yyyy",
                                                                                    functions.stringToDate(getJsonField(
                                                                                      prabhupadaListItem,
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
                                                                                          'tx5m0q3z' /* Play */,
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
                                                                                    key: Key('Keyxgz_${prabhupadaListIndex}_of_${prabhupadaList.length}'),
                                                                                    post: prabhupadaListItem,
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('PLAYLIST_PAGE_Container_v4kqz5sd_ON_TAP');
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
                                                                                      logFirebaseEvent('PLAYLIST_PAGE_Container_yajkuaft_ON_TAP');
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
                                                                                        logFirebaseEvent('PLAYLIST_PAGE_Container_mwsmf3g0_ON_TAP');
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
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFD9D9D9),
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
                                                      .playlistItemsCall
                                                      .dataList(
                                                        playlistPlaylistItemsResponse
                                                            .jsonBody,
                                                      )
                                                      ?.where((e) =>
                                                          functions.jsonToint(e,
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
                                                primary: false,
                                                shrinkWrap: true,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 8.0,
                                                                20.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'PLAYLIST_PAGE_Row_2axwxq3v_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

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
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      double
                                                                          screenWidth =
                                                                          MediaQuery.of(context)
                                                                              .size
                                                                              .width;

                                                                      double
                                                                          imageWidth;
                                                                      double
                                                                          imageHeight;

                                                                      if (screenWidth <
                                                                          400) {
                                                                        imageWidth =
                                                                            90.0;
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
                                                                        getJsonField(videoListItem,
                                                                                r'''$.image''')
                                                                            .toString(),
                                                                        width:
                                                                            imageWidth,
                                                                        height:
                                                                            imageHeight,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          width:
                                                                              imageWidth,
                                                                          height:
                                                                              imageHeight,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
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
                                                                                          '0ofdiyip' /* Play */,
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
                                                                                    key: Key('Keynnb_${videoListIndex}_of_${videoList.length}'),
                                                                                    post: videoListItem,
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('PLAYLIST_PAGE_Container_vitg7t8x_ON_TAP');
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
                                                                                      logFirebaseEvent('PLAYLIST_PAGE_Container_embstn69_ON_TAP');
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
                                                                                        logFirebaseEvent('PLAYLIST_PAGE_Container_d2as3wfn_ON_TAP');
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
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFD9D9D9),
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
          );
        },
      ),
    );
  }
}
