import 'package:audio_service/audio_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:v_v_p_swami/audio_helpers/main_player/play_list.dart';
import 'package:v_v_p_swami/audio_helpers/page_manager.dart';
import 'package:v_v_p_swami/audio_helpers/service_locator.dart';
import 'package:v_v_p_swami/components/notes/notes_widget.dart';
import 'package:v_v_p_swami/components/saveto_playlist/saveto_playlist_widget.dart';
import 'package:v_v_p_swami/flutter_flow/flutter_flow_theme.dart';
import 'package:v_v_p_swami/flutter_flow/flutter_flow_util.dart';
import '/components/like_unlike/like_unlike_widget.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/actions/actions.dart' as action_blocks;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/flutter_html.dart';

class MainPlayerView extends StatefulWidget {
  const MainPlayerView({super.key});

  @override
  State<MainPlayerView> createState() => _MainPlayerViewState();
}

class _MainPlayerViewState extends State<MainPlayerView>
    with TickerProviderStateMixin {
  bool showTranscript = false;
  bool showShloka = false;
  bool isDownloadingToLocal = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 500.0.ms,
            duration: 8000.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-200.0, 0.0),
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
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    final pageManager = getIt<PageManager>();

    // return SafeArea(
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xffEFDBB6),
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xFF436073),
                size: 32.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: AutoSizeText(
              FFLocalizations.of(context).getText(
                'o5daqsrv' /* Now Playing */,
              ),
              textAlign: TextAlign.center,
              minFontSize: 12.0,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
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
            child: ValueListenableBuilder<MediaItem?>(
              valueListenable: pageManager.currentSongNotifier,
              builder: (context, mediaItem, child) {
                if (mediaItem == null) {
                  return Center(
                    child: SizedBox(
                      width: 65,
                      height: 65,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ),
                  );
                }
      
                return Stack(children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        pageManager.currentSongNotifier,
                                    builder: (context, value, child) {
                                      final content = getJsonField(
                                        pageManager.currentSongNotifier.value!
                                            .extras!['json'],
                                        r'''$.content''',
                                      );
                                      final content2 = getJsonField(
                                        pageManager.currentSongNotifier.value!
                                            .extras!['json'],
                                        r'''$.content_2''',
                                      );
      
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: showShloka
                                            ? (content2 != null
                                                ? Container(
                                                    width: media.width,
                                                    height: 300,
                                                    padding: EdgeInsets.all(16.0),
                                          color: Colors.white.withOpacity(0.5), // Optional: Set a background color
                                                    child: SingleChildScrollView(
                                                      child: Html(
                                                        data: functions
                                                            .cleanHtmlContent(
                                                                content2),
                                                        style: {
                                                          "body": Style(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize:
                                                                FontSize(14.0),
                                                            fontFamily: 'Poppins',
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                          "h1": Style(
                                                            fontSize:
                                                                FontSize(18.0),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          "h2": Style(
                                                            fontSize:
                                                                FontSize(16.0),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          "h3": Style(
                                                            fontSize:
                                                                FontSize(15.0),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          "strong": Style(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          "p": Style(
                                                            margin: Margins.only(
                                                                bottom: 8),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          "br": Style(
                                                            margin: Margins.only(
                                                                bottom: 4),
                                                          ),
                                                        },
                                                        onLinkTap: (String? url,
                                                            Map<String, String>
                                                                attributes,
                                                            element) async {
                                                          if (url != null) {
                                                            final uri =
                                                                Uri.tryParse(url);
                                                            if (uri != null &&
                                                                await canLaunchUrl(
                                                                    uri)) {
                                                              await launchUrl(uri,
                                                                  mode: LaunchMode
                                                                      .externalApplication);
                                                            }
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: media.width,
                                                    height: 300,
                                                    padding: EdgeInsets.all(16.0),
                                                    color: Colors
                                                        .white, // Optional: Set a background color
                                                    child: Center(
                                                      child: Text(
                                                        'No Shloka Available', // Text displayed when content2 is null
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ))
                                            : showTranscript
                                                ? (content != null
                                                    ? Container(
                                                        width: media.width,
                                                        height: 300,
                                                        padding:
                                                            EdgeInsets.all(16.0),
                                          color: Colors.white.withOpacity(0.5), // Optional: Set a background color
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Html(
                                                            data: functions
                                                                .cleanHtmlContent(
                                                                    content),
                                                            style: {
                                                              "body": Style(
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                fontSize:
                                                                    FontSize(
                                                                        14.0),
                                                                fontFamily:
                                                                    'Poppins',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              "h1": Style(
                                                                fontSize:
                                                                    FontSize(
                                                                        18.0),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                              ),
                                                              "h2": Style(
                                                                fontSize:
                                                                    FontSize(
                                                                        16.0),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                              ),
                                                              "h3": Style(
                                                                fontSize:
                                                                    FontSize(
                                                                        15.0),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                              ),
                                                              "strong": Style(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                              ),
                                                              "p": Style(
                                                                margin:
                                                                    Margins.only(
                                                                        bottom:
                                                                            8),
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                              ),
                                                              "br": Style(
                                                                margin:
                                                                    Margins.only(
                                                                        bottom:
                                                                            4),
                                                              ),
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        width: media.width,
                                                        height: 300,
                                                        padding:
                                                            EdgeInsets.all(16.0),
                                                        color: Colors
                                                            .white, // Optional: Set a background color
                                                        child: Center(
                                                          child: Text(
                                                            'No Transcript Available', // Text displayed when content is null
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                        ),
                                                      ))
                                                : CachedNetworkImage(
                                                    imageUrl: mediaItem.artUri
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                    errorWidget:
                                                        (context, url, error) {
                                                      return Image.asset(
                                                        "assets/images/app_launcher_icon.png",
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                    placeholder: (context, url) {
                                                      return Image.asset(
                                                        "assets/images/app_launcher_icon.png",
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                    width: double.infinity,
                                                    height: 300,
                                                  ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Generated code for this Row Widget...
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: AutoSizeText(
                                            pageManager
                                                .currentSongNotifier.value!.title,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 10,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF232323),
                                                  fontSize: 18,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (getJsonField(
                                              pageManager.currentSongNotifier
                                                  .value!.extras!['json'],
                                              r'''$.shloka_part''',
                                            ) !=
                                            null)
                                          Flexible(
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                functions.combineTextFromJson(
                                                    getJsonField(
                                                      pageManager
                                                          .currentSongNotifier
                                                          .value!
                                                          .extras!['json'],
                                                      r'''$.shloka_part''',
                                                    ).toString(),
                                                    getJsonField(
                                                      pageManager
                                                          .currentSongNotifier
                                                          .value!
                                                          .extras!['json'],
                                                      r'''$.shloka_chapter''',
                                                    ).toString()),
                                                '-',
                                              ),
                                              maxLines: 1,
                                              minFontSize: 8,
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .backGrey,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        if ((getJsonField(
                                                  pageManager.currentSongNotifier
                                                      .value!.extras!['json'],
                                                  r'''$.city''',
                                                ) !=
                                                null) &&
                                            (getJsonField(
                                                  pageManager.currentSongNotifier
                                                      .value!.extras!['json'],
                                                  r'''$.shloka_part''',
                                                ) !=
                                                null))
                                          SizedBox(
                                            height: 16,
                                            child: VerticalDivider(
                                              thickness: 1,
                                              color: Color(0xFF7ECBC9),
                                            ),
                                          ),
                                        if (getJsonField(
                                              pageManager.currentSongNotifier
                                                  .value!.extras!['json'],
                                              r'''$.city''',
                                            ) !=
                                            null)
                                          AutoSizeText(
                                            getJsonField(
                                              pageManager.currentSongNotifier
                                                  .value!.extras!['json'],
                                              r'''$.city''',
                                            ).toString(),
                                            maxLines: 1,
                                            minFontSize: 8,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .backGrey,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        if (getJsonField(
                                              pageManager.currentSongNotifier
                                                  .value!.extras!['json'],
                                              r'''$.date''',
                                            ) !=
                                            null)
                                          SizedBox(
                                            height: 16,
                                            child: VerticalDivider(
                                              thickness: 1,
                                              color: Color(0xFF7ECBC9),
                                            ),
                                          ),
                                        if (getJsonField(
                                              pageManager.currentSongNotifier
                                                  .value!.extras!['json'],
                                              r'''$.date''',
                                            ) !=
                                            null)
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                "yyyy",
                                                functions
                                                    .stringToDate(getJsonField(
                                                  pageManager.currentSongNotifier
                                                      .value!.extras!['json'],
                                                  r'''$.date''',
                                                ).toString()),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '-',
                                            ),
                                            maxLines: 1,
                                            minFontSize: 8,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .backGrey,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        if (pageManager.currentSongNotifier.value!
                                                .extras!['json']['author'] !=
                                            null)
                                          SizedBox(
                                            height: 16,
                                            child: VerticalDivider(
                                              thickness: 1,
                                              color: Color(0xFF7ECBC9),
                                            ),
                                          ),
                                        if (pageManager.currentSongNotifier.value!
                                                .extras!['json']['author'] !=
                                            null)
                                          AutoSizeText(
                                            pageManager.currentSongNotifier.value!
                                                .extras!['json']['author'],
                                            maxLines: 1,
                                            minFontSize: 8,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .backGrey,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  if (functions
                                          .jsonToint(
                                              pageManager.currentSongNotifier
                                                  .value!.extras!['json'],
                                              'post_type_id')
                                          .toString() !=
                                      '12')
                                    Row(
                                      children: [
                                        Flexible(
                                          child: LikeUnlikeWidget(
                                              post: pageManager
                                                  .currentSongNotifier
                                                  .value!
                                                  .extras!['json']),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding:
                                                          MediaQuery.viewInsetsOf(
                                                              context),
                                                      child: NotesWidget(
                                                        post: pageManager
                                                            .currentSongNotifier
                                                            .value!
                                                            .extras!['json'],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: AlignmentDirectional(0, 0),
                                            child: Icon(
                                              Icons.edit_note_outlined,
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              size: 21,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding:
                                                          MediaQuery.viewInsetsOf(
                                                              context),
                                                      child: SavetoPlaylistWidget(
                                                        post: pageManager
                                                            .currentSongNotifier
                                                            .value!
                                                            .extras!['json'],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 28,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: AlignmentDirectional(0, 0),
                                            child: Icon(
                                              Icons.playlist_add,
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                        if (functions.isFavourite(
                                            int.parse(pageManager
                                                .currentSongNotifier.value!.id),
                                            FFAppState()
                                                .DownloadedFiles
                                                .toList()))
                                          // Container(
                                          //   width: 28.0,
                                          //   height: 28.0,
                                          //   decoration: BoxDecoration(
                                          //     color: FlutterFlowTheme.of(context)
                                          //         .secondaryBackground,
                                          //     shape: BoxShape.circle,
                                          //   ),
                                          //   alignment: const AlignmentDirectional(
                                          //       0.0, 0.0),
                                          //   child: Icon(
                                          //     Icons.download_done,
                                          //     color: FlutterFlowTheme.of(context)
                                          //         .error,
                                          //     size: 21.0,
                                          //   ),
                                          // ),
                                          if (!isDownloadingToLocal &&
                                              !functions.isFavourite(
                                                  int.parse(pageManager
                                                      .currentSongNotifier
                                                      .value!
                                                      .id),
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
                                                setState(() {
                                                  isDownloadingToLocal = true;
                                                });
                                                logFirebaseEvent(
                                                    'Container_widget_animation');
                                                if (animationsMap[
                                                        'iconOnActionTriggerAnimation'] !=
                                                    null) {
                                                  animationsMap[
                                                          'iconOnActionTriggerAnimation']!
                                                      .controller
                                                    ..reset()
                                                    ..repeat(
                                                        period: const Duration(
                                                            seconds: 1));
                                                }
                                                try {
                                                  logFirebaseEvent(
                                                      'Container_action_block');
                                                  await action_blocks
                                                      .downloadFile(
                                                    context,
                                                    fileJson: FFAppState()
                                                        .currentAudioTrack,
                                                  );
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Download failed: \\${e.toString()}'),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  );
                                                } finally {
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
                                                  setState(() {
                                                    isDownloadingToLocal = false;
                                                  });
                                                }
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
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
                                                    const AlignmentDirectional(
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
                                        if (isDownloadingToLocal)
                                          Container(
                                            width: 28.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: const AlignmentDirectional(
                                                0.0, 0.0),
                                            child: Icon(
                                              Icons.downloading,
                                              color: FlutterFlowTheme.of(context)
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
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NOW_PLAYING_Container_0zf1g3um_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_share');
                                                await Share.share(
                                                  getJsonField(
                                                    pageManager
                                                        .currentSongNotifier
                                                        .value!
                                                        .extras!['json'],
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
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.share,
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryText,
                                                  size: 21.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ].divide(
                                        const SizedBox(
                                          width: 10,
                                        ),
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
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 29,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0,
                                  -6,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFEFDBB6),
                                Color(0xFFFEF7E7),
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0.0, 1.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          showTranscript =
                                              !showTranscript; // Toggle Transcript
                                          showShloka =
                                              false; // Ensure Shloka is not shown
                                        });
                                      },
                                      child: Text(
                                        'Transcript',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            opaque: false,
                                            pageBuilder: (_, ___, __) =>
                                                const PlayPlayList(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Up Next',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          showShloka =
                                              !showShloka; // Toggle Shloka
                                          showTranscript =
                                              false; // Ensure Transcript is not shown
                                        });
                                      },
                                      child: Text(
                                        'Shloka',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      dense: false,
                                      title: TextScroll(
                                        mediaItem.title,
                                        intervalSpaces: 10,
                                        // numberOfReps: 2,
                                        velocity: Velocity(
                                            pixelsPerSecond: Offset(50, 0)),
                                        style: TextStyle(
                                          color: Color(0xff232323),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      subtitle: Text(
                                        mediaItem.artist ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          imageUrl: mediaItem.artUri.toString(),
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) {
                                            return Image.asset(
                                              "assets/images/app_launcher_icon.png",
                                              height: 345,
                                              width: 345,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                          placeholder: (context, url) {
                                            return Image.asset(
                                              "assets/images/app_launcher_icon.png",
                                              height: 345,
                                              width: 345,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                          width: 54,
                                          height: 54,
                                        ),
                                      ),
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable:
                                          pageManager.progressNotifier,
                                      builder: (context, valueState, child) {
                                        bool dragging = false;
      
                                        final value = min(
                                            valueState.current.inMilliseconds
                                                .toDouble(),
                                            valueState.total.inMilliseconds
                                                .toDouble());
      
                                        return SliderTheme(
                                          data: const SliderThemeData(
                                            trackHeight: 2,
                                            thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius: 8),
                                            overlayShape: RoundSliderOverlayShape(
                                                overlayRadius: 16),
                                          ),
                                          child: Slider(
                                            value: value,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            inactiveColor: const Color.fromARGB(
                                                100, 0, 0, 0),
                                            min: 0,
                                            max: max(
                                                valueState.current.inMilliseconds
                                                    .toDouble(),
                                                valueState.total.inMilliseconds
                                                    .toDouble()),
                                            onChanged: (newVal) {
                                              if (!dragging) {
                                                dragging = true;
                                              }
      
                                              pageManager.seek(
                                                Duration(
                                                  milliseconds: newVal.round(),
                                                ),
                                              );
                                            },
                                            onChangeEnd: (value) {
                                              pageManager.seek(
                                                Duration(
                                                  milliseconds: value.round(),
                                                ),
                                              );
                                              dragging = false;
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable:
                                          pageManager.progressNotifier,
                                      builder: (context, valueState, child) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                                        .firstMatch(
                                                            '${valueState.current}')
                                                        ?.group(1) ??
                                                    '${valueState.current}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                                        .firstMatch(
                                                            '${valueState.total}')
                                                        ?.group(1) ??
                                                    '${valueState.total}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed:
                                              pageManager.seekBackward10Seconds,
                                          icon: const Icon(
                                            Icons.replay_10,
                                            size: 20,
                                            color: Color(0xFF232323),
                                          ),
                                        ),
                                        ValueListenableBuilder<bool>(
                                          valueListenable:
                                              pageManager.isFirstSongNotifier,
                                          builder: (context, isFirst, child) {
                                            return IconButton(
                                              onPressed: (isFirst)
                                                  ? null
                                                  : pageManager.previous,
                                              icon: Icon(
                                                Icons.skip_previous_rounded,
                                                size: 32,
                                                color: (isFirst)
                                                    ? const Color(0xFF232323)
                                                    : const Color(0xFF232323),
                                              ),
                                            );
                                          },
                                        ),
                                        ValueListenableBuilder<ButtonState>(
                                          valueListenable:
                                              pageManager.playButtonNotifier,
                                          builder: (context, value, child) {
                                            return Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                value == ButtonState.loading
                                                    ? SizedBox(
                                                        width: 65,
                                                        height: 65,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText),
                                                        ),
                                                      )
                                                    : Container(
                                                        width: 65,
                                                        height: 65,
                                                        decoration: BoxDecoration(
                                                          color:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .lightCoral,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40),
                                                        ),
                                                        child: value ==
                                                                ButtonState
                                                                    .playing
                                                            ? InkWell(
                                                                onTap: pageManager
                                                                    .pause,
                                                                child: Icon(
                                                                  Icons
                                                                      .pause_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .oldLace,
                                                                  size: 45,
                                                                ),
                                                              )
                                                            : InkWell(
                                                                onTap: pageManager
                                                                    .play,
                                                                child: Icon(
                                                                  Icons
                                                                      .play_arrow_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .oldLace,
                                                                  size: 45,
                                                                ),
                                                              ),
                                                      ),
                                              ],
                                            );
                                          },
                                        ),
                                        ValueListenableBuilder<bool>(
                                          valueListenable:
                                              pageManager.isLastSongNotifier,
                                          builder: (context, isLast, child) {
                                            return IconButton(
                                              onPressed: (isLast)
                                                  ? null
                                                  : pageManager.next,
                                              icon: Icon(
                                                size: 32,
                                                Icons.skip_next_rounded,
                                                color: (isLast)
                                                    ? const Color(0xFF232323)
                                                    : const Color(0xFF232323),
                                              ),
                                            );
                                          },
                                        ),
                                        IconButton(
                                          onPressed:
                                              pageManager.seekForward10Seconds,
                                          icon: const Icon(
                                            Icons.forward_10,
                                            size: 20,
                                            color: Color(0xFF232323),
                                          ),
                                        ),
                                      ].divide(
                                        const SizedBox(
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]);
              },
            ),
          ),
        ),
        // ),
        // );
      ),
    );
  }
}
