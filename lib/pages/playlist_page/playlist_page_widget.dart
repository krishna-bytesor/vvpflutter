import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'playlist_page_model.dart';
export 'playlist_page_model.dart';

class PlaylistPageWidget extends StatefulWidget {
  const PlaylistPageWidget({super.key});

  static String routeName = 'PlaylistPage';
  static String routePath = '/playlistPage';

  @override
  State<PlaylistPageWidget> createState() => _PlaylistPageWidgetState();
}

class _PlaylistPageWidgetState extends State<PlaylistPageWidget> {
  late PlaylistPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PlaylistPage'});
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
    double iconSize = screenWidth < 400 ? 24.0 : screenWidth < 800 ? 32.0 : 42.0;
    double titleFontSize = screenWidth < 400 ? 13.0 : screenWidth < 800 ? 15.0 : 16.0;
    double subtitleFontSize = screenWidth < 400 ? 10.0 : screenWidth < 800 ? 11.0 : 12.0;
    double rowHeight = screenWidth < 400 ? 44.0 : screenWidth < 800 ? 54.0 : 60.0;
    double rowPadding = screenWidth < 400 ? 8.0 : 16.0;
    double rowSpacing = screenWidth < 400 ? 4.0 : 8.0;

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(LaravelGroup.allPlaylistCall.call(
              token: FFAppState().Token,
            )))
          .future,
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
        final playlistPageAllPlaylistResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SafeArea(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Row(
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
                                      'PLAYLIST_chevron_left_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                              AutoSizeText(
                                FFLocalizations.of(context).getText(
                                  '9yzcdnh5' /* Playlist */,
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
                              Container(
                                width: 60.0,
                                decoration: BoxDecoration(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final playList = LaravelGroup.allPlaylistCall
                                      .dataList(
                                        playlistPageAllPlaylistResponse
                                            .jsonBody,
                                      )
                                      .toList();
                                  if (playList.isEmpty) {
                                    return EmptyWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: playList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder: (context, playListIndex) {
                                      final playListItem =
                                          playList[playListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Container(
                                          height: rowHeight,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PLAYLIST_PAGE_PAGE_Row_j3912bn1_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                PlaylistWidget.routeName,
                                                queryParameters: {
                                                  'playlistItem':
                                                      serializeParam(
                                                    playListItem,
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.playlist_play,
                                                  color: FlutterFlowTheme.of(context).backGrey,
                                                  size: iconSize,
                                                ),
                                                Flexible(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              getJsonField(
                                                                playListItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                font: GoogleFonts.poppins(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                color: Color(0xFF232323),
                                                                fontSize: titleFontSize,
                                                                letterSpacing: 0.0,
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                            ),
                                                            AutoSizeText(
                                                              '${getJsonField(
                                                                playListItem,
                                                                r'''$.item_count''',
                                                              ).toString()} records',
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                font: GoogleFonts.poppins(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                fontSize: subtitleFontSize,
                                                                letterSpacing: 0.0,
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: rowSpacing)),
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
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'PLAYLIST_PAGE_PAGE_Icon_hkxgji75_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon_alert_dialog');
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text('Are you sure you want to delete this playlist ?'),
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
                                                                'Icon_backend_call');
                                                            _model.delete =
                                                                await LaravelGroup
                                                                    .deletePlaylistCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .Token,
                                                              id: getJsonField(
                                                                playListItem,
                                                                r'''$.id''',
                                                              ).toString(),
                                                            );

                                                            if ((_model.delete
                                                                    ?.succeeded ??
                                                                true)) {
                                                              logFirebaseEvent(
                                                                  'Icon_refresh_database_request');
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted();
                                                              logFirebaseEvent(
                                                                  'Icon_backend_call');
                                                              _model.allPlaylist =
                                                                  await LaravelGroup
                                                                      .allPlaylistCall
                                                                      .call(
                                                                token:
                                                                    FFAppState()
                                                                        .Token,
                                                              );

                                                              logFirebaseEvent(
                                                                  'Icon_update_app_state');
                                                              FFAppState()
                                                                      .PersonalPlaylist =
                                                                  LaravelGroup
                                                                      .allPlaylistCall
                                                                      .dataList(
                                                                        (_model.allPlaylist?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Icon_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          getJsonField(
                                                                        (_model.delete?.jsonBody ??
                                                                            ''),
                                                                        r'''$.message''',
                                                                      ).toString()),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Icon_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          getJsonField(
                                                                        (_model.delete?.jsonBody ??
                                                                            ''),
                                                                        r'''$.message''',
                                                                      ).toString()),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.delete_forever,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: iconSize,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: rowPadding)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
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
          )
        );
      },
    );
  }
}





