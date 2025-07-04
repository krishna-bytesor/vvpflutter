import 'package:audio_service/audio_service.dart';
import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';

import '../../audio_helpers/widget/mini_player_view.dart';
import '../../audio_helpers/mediaitem_converter.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_bar_model.dart';
export 'bottom_nav_bar_model.dart';
import 'package:v_v_p_swami/audio_helpers/page_manager.dart';
import 'package:v_v_p_swami/audio_helpers/audio_handler.dart';
import 'package:v_v_p_swami/audio_helpers/service_locator.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late BottomNavBarModel _model;
  late final PageManager pageManager = getIt<PageManager>();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Future<String?> getPlayableUrl(dynamic url) async {
    final urlStr = url.toString();
    if (urlStr.contains('youtube.com') || urlStr.contains('youtu.be')) {
      try {
        // Timeout after 5 seconds for YouTube processing
        final ytAudioUrl = await getYouTubeAudioStreamUrl(urlStr)
            .timeout(const Duration(seconds: 5), onTimeout: () {
          print('YouTube audio fetch timeout for: $urlStr');
          return null;
        });
        if (ytAudioUrl != null && ytAudioUrl.isNotEmpty) {
          print('Successfully processed YouTube URL: $urlStr -> $ytAudioUrl');
          return ytAudioUrl;
        } else {
          print('YouTube audio URL is null or empty for: $urlStr');
          return null;
        }
      } catch (e) {
        print('YouTube audio fetch failed for $urlStr: $e');
        return null;
      }
    }
    // For non-YouTube URLs, return as is
    if (urlStr.isNotEmpty && urlStr != 'null') {
      print('Processing non-YouTube URL: $urlStr');
      return urlStr;
    }
    return null;
  }

  Future<void> _loadRadioAudio() async {
    try {
      logFirebaseEvent('Column_backend_call');
      _model.radio = await LaravelGroup.postsListCall.call(
        token: FFAppState().Token,
        postTypeId: '12',
      );

      if ((_model.radio?.succeeded ?? true)) {
        print('Raw radio API data: ${(_model.radio?.jsonBody ?? '')}');
        final allItems = LaravelGroup.postsListCall
            .dataList((_model.radio?.jsonBody ?? ''))!;
        print('All radio items: ${allItems}');
        if (allItems.isNotEmpty) print('First item: ${allItems.first}');

        // Include all items (YouTube and non-YouTube)
        final radioList = allItems.toList();
        print('Radio playlist length: ${radioList.length}');
        print('Radio playlist items: ${radioList}');

        // First, try to process all URLs
        final urls = await Future.wait(radioList
            .map((item) => getPlayableUrl(getJsonField(item, r'$.data'))));
        print('Radio URLs: ${urls}');

        // If all URLs failed, try again with longer timeout for YouTube
        if (urls.every((url) => url == null) && radioList.isNotEmpty) {
          print('All URLs failed, retrying with longer timeout...');
          final retryUrls = await Future.wait(radioList.map((item) async {
            final originalUrl = getJsonField(item, r'$.data');
            if (originalUrl.toString().contains('youtube.com') ||
                originalUrl.toString().contains('youtu.be')) {
              try {
                final ytAudioUrl =
                    await getYouTubeAudioStreamUrl(originalUrl.toString())
                        .timeout(const Duration(seconds: 10), onTimeout: () {
                  print('YouTube retry timeout for: $originalUrl');
                  return null;
                });
                return ytAudioUrl;
              } catch (e) {
                print('YouTube retry failed for $originalUrl: $e');
                return null;
              }
            }
            return originalUrl.toString();
          }));
          print('Retry URLs: ${retryUrls}');

          // Use retry URLs if they're better
          if (retryUrls.any((url) => url != null)) {
            urls.clear();
            urls.addAll(retryUrls);
          }
        }

        final playlist = <MediaItem>[];
        int successfulItems = 0;
        int failedItems = 0;

        for (int i = 0; i < radioList.length; i++) {
          final url = urls[i];
          final item = radioList[i];
          final originalUrl = getJsonField(item, r'$.data');
          final title = getJsonField(item, r'$.title') ?? 'Unknown Title';

          if (url == null) {
            failedItems++;
            print('Skipping unplayable item: $title (URL: $originalUrl)');
            continue; // Skip unplayable
          }

          successfulItems++;
          print('Processing playable item: $title (URL: $url)');

          final itemMap = {
            'id': getJsonField(item, r'$.id'),
            'album': getJsonField(item, r'$.album'),
            'artist': getJsonField(item, r'$.author'),
            'duration': getJsonField(item, r'$.duration') ?? 180,
            'title': title,
            'image': getJsonField(item, r'$.image'),
            'language': getJsonField(item, r'$.language'),
            'url': url,
            'user_id': getJsonField(item, r'$.artistsId'),
            'user_name': getJsonField(item, r'$.artists'),
            'album_id': getJsonField(item, r'$.album_id'),
            'extra': {
              'json': item,
              'date': getJsonField(item, r'$.date'),
              'country': getJsonField(item, r'$.country'),
              'city': getJsonField(item, r'$.city'),
            },
          };
          playlist.add(await MediaItemConverter.mapToMediaItem(itemMap));
        }

        print(
            'Playlist building summary: $successfulItems successful, $failedItems failed out of ${radioList.length} total items');

        print('Built playlist length: ${playlist.length}');
        print('Built playlist: ${playlist}');

        if (playlist.isEmpty) {
          if (mounted) {
            String errorMessage = 'No playable audios found.';
            if (failedItems > 0) {
              errorMessage +=
                  ' $failedItems items failed to load (some YouTube videos may be restricted or unavailable).';
            }
            if (radioList.isEmpty) {
              errorMessage = 'No radio content available.';
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                duration: Duration(seconds: 4),
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: () => _loadRadioAudio(),
                ),
              ),
            );
          }
          return;
        }

        await (pageManager.audioHandler as MyAudioHandler)
            .setNewPlaylist(playlist, 0);

        // Show success message

      }
      safeSetState(() {});
    } catch (e) {
      print('Error loading radio audio: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading radio: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MiniPlayerView(),
        // Generated code for this Column Widget...
        Visibility(
          visible: valueOrDefault<bool>(
            FFAppState().isOnline,
            true,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(
                        'assets/images/Untitled_design_(7).png',
                      ).image,
                    ),
                  ),
                  child: // Generated code for this Row Widget...
                      Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_NAV_BAR_Column_84z54ijb_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');
                          context.goNamed(HomePageWidget.routeName);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: Color(0xFF5D3B23),
                              size: 24.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'h4nu73o1' /* Home */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF5D3B23),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_NAV_BAR_Column_bhd5azkk_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');
                          context.goNamed(SearchPageWidget.routeName);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_sharp,
                              color: Color(0xFF5D3B23),
                              size: 24.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '63c94nca' /* Search */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF5D3B23),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'BOTTOM_NAV_BAR_Column_3rtalg7q_ON_TAP');

                            // Immediately open the main player
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (_, ___, __) =>
                                    const MainPlayerView(),
                              ),
                            );

                            // Load radio audio in the background
                            _loadRadioAudio();
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.radio_outlined,
                                  color: Color(0xFF5D3B23),
                                  size: 24.0,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'rtjm3l36' /* Radio */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF5D3B23),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
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
                              'BOTTOM_NAV_BAR_Column_o9ie9gra_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');
                          context.pushNamed(LibraryWidget.routeName);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FFIcons.kbook,
                              color: Color(0xFF5D3B23),
                              size: 22.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '7qqon4ry' /* Library */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF5D3B23),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_NAV_BAR_Column_jzts95d8_ON_TAP');
                          logFirebaseEvent('Column_navigate_to');
                          context.goNamed(ProfilePageWidget.routeName);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline_sharp,
                              color: Color(0xFF5D3B23),
                              size: 24.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'u24p03rd' /* Profile */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF5D3B23),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
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
      ],
    );
  }
}
