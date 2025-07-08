import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/filter/filter_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'audio_list_model.dart';
import 'package:v_v_p_swami/audio_helpers/service_locator.dart';
import 'package:v_v_p_swami/audio_helpers/mediaitem_converter.dart';
import 'package:v_v_p_swami/audio_helpers/page_manager.dart';
import 'package:v_v_p_swami/audio_helpers/audio_handler.dart';
import 'package:v_v_p_swami/audio_helpers/mediaitem_converter.dart'
    show getYouTubeAudioStreamUrl;
export 'audio_list_model.dart';

class AudioListWidget extends StatefulWidget {
  const AudioListWidget({
    super.key,
    required this.categoryItem,
  });

  final dynamic categoryItem;

  static String routeName = 'AudioList';
  static String routePath = '/audioList';

  @override
  State<AudioListWidget> createState() => _AudioListWidgetState();
}

class _AudioListWidgetState extends State<AudioListWidget> {
  late AudioListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? loadingIndex;
  late final PageManager pageManager;
  late final VoidCallback playStateListener;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioListModel());
    pageManager = getIt<PageManager>();
    playStateListener = () {
      if (pageManager.playButtonNotifier.value == ButtonState.playing) {
        if (mounted && loadingIndex != null) {
          setState(() {
            loadingIndex = null;
          });
        }
      }
    };
    pageManager.playButtonNotifier.addListener(playStateListener);
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AudioList'});
  }

  @override
  void dispose() {
    _model.dispose();
    pageManager.playButtonNotifier.removeListener(playStateListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      // child: SafeArea(
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          body: FutureBuilder<ApiCallResponse>(
            // Use a unique key for the filter to force reload
            key: ValueKey(_model.filter?.toMap().toString() ?? 'no_filter'),
            future: _model.audioListPage(
              uniqueQueryKey: _model.filter?.toMap().toString(),
              overrideCache: true,
              requestFn: () => LaravelGroup.postsListCall.call(
                postTypeId: getJsonField(
                  widget.categoryItem,
                  r'''$.post_type_id''',
                ).toString(),
                categoryId: getJsonField(
                  widget.categoryItem,
                  r'''$.id''',
                ).toString(),
                token: FFAppState().Token,
              ),
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
              // Store the full unfiltered list once after API call
              final allAudioList = LaravelGroup.postsListCall
                      .dataList(
                        containerPostsListResponse.jsonBody,
                      )
                      ?.toList() ??
                  [];

              // Print filter values for debugging
              final filter = _model.filter;
              print('FILTER DEBUG: filter = ${filter?.toMap()}');
              print(
                  'FILTER DEBUG: allAudioList.length = ${allAudioList.length}');

              // Apply filter in-memory
              List<dynamic> audioList = allAudioList;
              if (filter != null &&
                  ((filter.festival != null && filter.festival != '') ||
                      (filter.place != null && filter.place != '') ||
                      (filter.year != null && filter.year != '') ||
                      (filter.language != null && filter.language != '') ||
                      (filter.shloka != null && filter.shloka != ''))) {
                audioList = allAudioList.where((e) {
                  final matchesFestival = filter.festival == null ||
                      filter.festival == '' ||
                      getJsonField(e, r'$.festival').toString() ==
                          filter.festival;
                  final matchesYear = filter.year == null ||
                      filter.year == '' ||
                      dateTimeFormat(
                            "yyyy",
                            functions.stringToDate(
                                getJsonField(e, r'$.date').toString()),
                            locale: FFLocalizations.of(context).languageCode,
                          ) ==
                          filter.year;
                  final matchesPlace = filter.place == null ||
                      filter.place == '' ||
                      getJsonField(e, r'$.city').toString() == filter.place;
                  final matchesLanguage = filter.language == null ||
                      filter.language == '' ||
                      getJsonField(e, r'$.language').toString() ==
                          filter.language;
                  final matchesShloka = filter.shloka == null ||
                      filter.shloka == '' ||
                      (functions.combineTextFromJson(
                              getJsonField(e, r'$.shloka_part').toString(),
                              getJsonField(e, r'$.shloka_chapter')
                                  .toString()) ==
                          filter.shloka);
                  return matchesFestival &&
                      matchesYear &&
                      matchesPlace &&
                      matchesLanguage &&
                      matchesShloka;
                }).toList();
              }
              print(
                  'FILTER DEBUG: filtered audioList.length = ${audioList.length}');

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
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
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
                                  'AUDIO_LIST_PAGE_chevron_left_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.pop();
                            },
                          ),
                          Flexible(
                            child: Text(
                              getJsonField(
                                widget.categoryItem,
                                r'''$.name''',
                              ).toString().maybeHandleOverflow(
                                    maxChars: 20,
                                    replacement: '…',
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
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
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'AUDIO_LIST_PAGE_Icon_xilfuytq_ON_TAP');
                                logFirebaseEvent('Icon_bottom_sheet');
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
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: FilterWidget(
                                            festivalList:
                                                LaravelGroup.postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )!
                                                    .map((e) => getJsonField(
                                                          e,
                                                          r'''$.festival''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e.toString())
                                                    .toList(),
                                            yearList: LaravelGroup.postsListCall
                                                .dataList(
                                                  containerPostsListResponse
                                                      .jsonBody,
                                                )!
                                                .unique((e) => dateTimeFormat(
                                                      "yyyy",
                                                      functions.stringToDate(
                                                          getJsonField(
                                                        e,
                                                        r'''$.date''',
                                                      ).toString()),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))
                                                .map((e) => dateTimeFormat(
                                                      "yyyy",
                                                      functions.stringToDate(
                                                          getJsonField(
                                                        e,
                                                        r'''$.date''',
                                                      ).toString()),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))
                                                .toList(),
                                            placeList:
                                                LaravelGroup.postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )!
                                                    .map((e) => getJsonField(
                                                          e,
                                                          r'''$.city''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e.toString())
                                                    .toList(),
                                            languageList:
                                                LaravelGroup.postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )!
                                                    .unique((e) => getJsonField(
                                                          e,
                                                          r'''$.language''',
                                                        ))
                                                    .map((e) => getJsonField(
                                                          e,
                                                          r'''$.language''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e.toString())
                                                    .toList(),
                                            shlokaList: LaravelGroup
                                                .postsListCall
                                                .dataList(
                                                  containerPostsListResponse
                                                      .jsonBody,
                                                )!
                                                .map((e) => functions
                                                    .combineTextFromJson(
                                                        getJsonField(
                                                          e,
                                                          r'''$.shloka_part''',
                                                        ).toString(),
                                                        getJsonField(
                                                          e,
                                                          r'''$.shloka_chapter''',
                                                        ).toString()))
                                                .toList(),
                                            languageInitial:
                                                _model.languageInitial,
                                            yearInitial: _model.yearInitial,
                                            placeInitial: _model.placeInitial,
                                            festivalInitial:
                                                _model.festivalInitial,
                                            shlokaInitial: _model.shlokaInitial,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) {
                                  setState(() {
                                    _model.filter = value;
                                    _model.languageInitial =
                                        _model.filter?.language;
                                    _model.yearInitial = _model.filter?.year;
                                    _model.placeInitial = _model.filter?.place;
                                    _model.festivalInitial =
                                        _model.filter?.festival;
                                    _model.shlokaInitial =
                                        _model.filter?.shloka;
                                  });
                                });
                              },
                              child: Icon(
                                Icons.filter_alt_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Builder(
                          builder: (context) {
                            if (audioList.isEmpty) {
                              return EmptyWidget();
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: audioList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 8.0),
                              itemBuilder: (context, audioListIndex) {
                                final audioListItem = audioList[audioListIndex];
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
                                            // Immediately show loading spinner in MainPlayer and MiniPlayer
                                            pageManager
                                                .setLoadingNewAudio(true);
                                            pageManager.playButtonNotifier
                                                .value = ButtonState.loading;
                                            pageManager.currentSongNotifier
                                                .value = null;
                                            // Immediately stop any currently playing audio
                                            await pageManager.audioHandler
                                                .stop();
                                            // Fetch all URLs in parallel (but don't await)
                                            Future(() async {
                                              final urls = await Future.wait(
                                                  audioList.map((item) =>
                                                      getPlayableUrl(
                                                          getJsonField(item,
                                                              r'$.data'))));
                                              final playlist = <MediaItem>[];
                                              for (int i = 0;
                                                  i < audioList.length;
                                                  i++) {
                                                final item = audioList[i];
                                                final url = urls[i];
                                                final itemMap = {
                                                  'id': getJsonField(
                                                      item, r'$.id'),
                                                  'album': getJsonField(
                                                      item, r'$.album'),
                                                  'artist': getJsonField(
                                                      item, r'$.author'),
                                                  'duration': getJsonField(item,
                                                          r'$.duration') ??
                                                      180,
                                                  'title': getJsonField(
                                                      item, r'$.title'),
                                                  'image': getJsonField(
                                                      item, r'$.image'),
                                                  'language': getJsonField(
                                                      item, r'$.language'),
                                                  'url': url,
                                                  'user_id': getJsonField(
                                                      item, r'$.artistsId'),
                                                  'user_name': getJsonField(
                                                      item, r'$.artists'),
                                                  'album_id': getJsonField(
                                                      item, r'$.album_id'),
                                                  'extra': {
                                                    'json': item,
                                                    'date': getJsonField(
                                                        item, r'$.date'),
                                                    'country': getJsonField(
                                                        item, r'$.country'),
                                                    'city': getJsonField(
                                                        item, r'$.city'),
                                                  },
                                                };
                                                playlist.add(
                                                    await MediaItemConverter
                                                        .mapToMediaItem(
                                                            itemMap));
                                              }
                                              await (pageManager.audioHandler
                                                      as MyAudioHandler)
                                                  .setNewPlaylist(
                                                      playlist, audioListIndex);
                                            });
                                            // Immediately open MainPlayerView
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (_, ___, __) =>
                                                    const MainPlayerView(),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (getJsonField(
                                                    audioListItem,
                                                    r'''$.image''',
                                                  ) !=
                                                  null)
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
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
                                                      fit: BoxFit.cover,
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/AboutImage.png',
                                                    width: 104.0,
                                                    height: 104.0,
                                                    fit: BoxFit.cover,
                                                    alignment: const Alignment(
                                                        -1.0, 0.0),
                                                  ),
                                                ),
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                              MainAxisSize.max,
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
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      audioListItem,
                                                                      r'''$.title''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF232323),
                                                                          fontSize:
                                                                              16,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      // Generated code for this Wrap Widget...
                                                      Wrap(
                                                        spacing: 0,
                                                        runSpacing: 0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          if (getJsonField(
                                                                audioListItem,
                                                                r'''$.shloka_part''',
                                                              ) !=
                                                              null)
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.combineTextFromJson(
                                                                    getJsonField(
                                                                      audioListItem,
                                                                      r'''$.shloka_part''',
                                                                    ).toString(),
                                                                    getJsonField(
                                                                      audioListItem,
                                                                      r'''$.shloka_chapter''',
                                                                    ).toString()),
                                                                '-',
                                                              ),
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .backGrey,
                                                                    fontSize:
                                                                        13,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          if ((getJsonField(
                                                                    audioListItem,
                                                                    r'''$.shloka_part''',
                                                                  ) !=
                                                                  null) &&
                                                              (getJsonField(
                                                                    audioListItem,
                                                                    r'''$.author''',
                                                                  ) !=
                                                                  null))
                                                            SizedBox(
                                                              height: 16,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 1,
                                                                color: Color(
                                                                    0xFF7ECBC9),
                                                              ),
                                                            ),
                                                          if (getJsonField(
                                                                audioListItem,
                                                                r'''$.author''',
                                                              ) !=
                                                              null)
                                                            Text(
                                                              getJsonField(
                                                                audioListItem,
                                                                r'''$.author''',
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .backGrey,
                                                                    fontSize:
                                                                        13,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          if ((getJsonField(
                                                                    audioListItem,
                                                                    r'''$.author''',
                                                                  ) !=
                                                                  null) &&
                                                              (getJsonField(
                                                                    audioListItem,
                                                                    r'''$.date''',
                                                                  ) !=
                                                                  null))
                                                            SizedBox(
                                                              height: 16,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 1,
                                                                color: Color(
                                                                    0xFF7ECBC9),
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
                                                                  functions
                                                                      .stringToDate(
                                                                          getJsonField(
                                                                    audioListItem,
                                                                    r'''$.date''',
                                                                  ).toString()),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                '-',
                                                              ),
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .backGrey,
                                                                    fontSize:
                                                                        13,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                8.0, 0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
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
                                                                        'bqcznszn' /* Play */,
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
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                if (functions
                                                                    .isFavourite(
                                                                        getJsonField(
                                                                          audioListItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        FFAppState()
                                                                            .FavouriteList
                                                                            .toList()))
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
                                                                      await action_blocks
                                                                          .likeUnlikePost(
                                                                        context,
                                                                        postItem:
                                                                            audioListItem,
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
                                                                          Icon(
                                                                        Icons
                                                                            .favorite,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (!functions
                                                                    .isFavourite(
                                                                        getJsonField(
                                                                          audioListItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        FFAppState()
                                                                            .FavouriteList
                                                                            .toList()))
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
                                                                      await action_blocks
                                                                          .likeUnlikePost(
                                                                        context,
                                                                        postItem:
                                                                            audioListItem,
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
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
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
                                                                            onTap: () =>
                                                                                FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: NotesWidget(
                                                                                post: audioListItem,
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
                                                                    height:
                                                                        28.0,
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
                                                                      size:
                                                                          18.0,
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
                                                                            onTap: () =>
                                                                                FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: SavetoPlaylistWidget(
                                                                                post: audioListItem,
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
                                                                    height:
                                                                        28.0,
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
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (FFAppConstants
                                                                    .HideShare)
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
                                                                      await action_blocks
                                                                          .allShare(
                                                                        context,
                                                                        url:
                                                                            getJsonField(
                                                                          audioListItem,
                                                                          r'''$.data''',
                                                                        ).toString(),
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
                                                                if (false)
                                                                  Container(
                                                                    width: 28.0,
                                                                    height:
                                                                        28.0,
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
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                              ].divide(
                                                                  const SizedBox(
                                                                      width:
                                                                          4.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(const SizedBox(
                                                        height: 8.0)),
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
                        updateCallback: () => setState(() {}),
                        child: const BottomNavBarWidget(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      // ),
    );
  }

  Future<String> getPlayableUrl(dynamic url) async {
    final urlStr = url.toString();
    if (urlStr.contains('youtube.com') || urlStr.contains('youtu.be')) {
      final ytAudioUrl = await getYouTubeAudioStreamUrl(urlStr);
      return ytAudioUrl ?? urlStr;
    }
    return urlStr;
  }
}
