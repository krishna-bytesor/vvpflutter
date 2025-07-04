import '/backend/api_requests/api_calls.dart';
import '/components/create_play_list/create_play_list_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'saveto_playlist_model.dart';
export 'saveto_playlist_model.dart';

class SavetoPlaylistWidget extends StatefulWidget {
  const SavetoPlaylistWidget({
    super.key,
    required this.post,
  });

  final dynamic post;

  @override
  State<SavetoPlaylistWidget> createState() => _SavetoPlaylistWidgetState();
}

class _SavetoPlaylistWidgetState extends State<SavetoPlaylistWidget> {
  late SavetoPlaylistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavetoPlaylistModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
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
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Container(
                  width: 70.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'cat09hq2' /* Save to Playlist */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).davysGray,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('SAVETO_PLAYLIST_COMP_add_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: CreatePlayListWidget(),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.refresh = value));

                        safeSetState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  height: 230.0,
                  decoration: BoxDecoration(),
                  child: FlutterFlowCheckboxGroup(
                    options: FFAppState()
                        .PersonalPlaylist
                        .map((e) => getJsonField(
                              e,
                              r'''$.name''',
                            ))
                        .toList()
                        .map((e) => e.toString())
                        .toList(),
                    onChanged: (val) =>
                        safeSetState(() => _model.checkboxGroupValues = val),
                    controller: _model.checkboxGroupValueController ??=
                        FormFieldController<List<String>>(
                      List.from(functions
                              .getMultipleDropdownItems(
                                  FFAppState().PersonalPlaylist.toList(),
                                  getJsonField(
                                    widget.post,
                                    r'''$.id''',
                                  ))
                              .map((e) => getJsonField(
                                    e,
                                    r'''$.name''',
                                  ))
                              .toList()
                              .map((e) => e.toString())
                              .toList() ??
                          []),
                    ),
                    activeColor: FlutterFlowTheme.of(context).primaryText,
                    checkColor: FlutterFlowTheme.of(context).info,
                    checkboxBorderColor:
                        FlutterFlowTheme.of(context).primaryText,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    itemPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    checkboxBorderRadius: BorderRadius.circular(4.0),
                    initialized: _model.checkboxGroupValues != null,
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'SAVETO_PLAYLIST_Container_23oybwhr_ON_TA');
                    logFirebaseEvent('Container_update_component_state');
                    _model.loader = true;
                    safeSetState(() {});
                    await Future.wait([
                      Future(() async {
                        while (_model.checkboxGroupValues?.length !=
                            _model.counter) {
                          logFirebaseEvent('Container_backend_call');
                          _model.addPlay =
                              await LaravelGroup.addToPlaylistCall.call(
                            token: FFAppState().Token,
                            postId: getJsonField(
                              widget.post,
                              r'''$.id''',
                            ).toString(),
                            id: functions
                                .getDropdownId(
                                    _model.checkboxGroupValues
                                        ?.elementAtOrNull(_model.counter),
                                    FFAppState().PersonalPlaylist.toList(),
                                    'name')
                                ?.toString(),
                          );

                          logFirebaseEvent('Container_update_component_state');
                          _model.counter = _model.counter + 1;
                          safeSetState(() {});
                        }
                        logFirebaseEvent('Container_update_component_state');
                        _model.counter = 0;
                        safeSetState(() {});
                      }),
                      Future(() async {
                        while (functions
                                .filterUncheckList(
                                    FFAppState()
                                        .PersonalPlaylist
                                        .map((e) => getJsonField(
                                              e,
                                              r'''$.name''',
                                            ))
                                        .toList()
                                        .map((e) => e.toString())
                                        .toList(),
                                    _model.checkboxGroupValues?.toList())
                                ?.length !=
                            _model.removeCounter) {
                          logFirebaseEvent('Container_backend_call');
                          _model.removePlay =
                              await LaravelGroup.removeFromPlaylistCall.call(
                            token: FFAppState().Token,
                            postId: getJsonField(
                              widget.post,
                              r'''$.id''',
                            ).toString(),
                            id: functions
                                .getDropdownId(
                                    functions
                                        .filterUncheckList(
                                            FFAppState()
                                                .PersonalPlaylist
                                                .map((e) => getJsonField(
                                                      e,
                                                      r'''$.name''',
                                                    ))
                                                .toList()
                                                .map((e) => e.toString())
                                                .toList(),
                                            _model.checkboxGroupValues
                                                ?.toList())
                                        ?.elementAtOrNull(_model.removeCounter),
                                    FFAppState().PersonalPlaylist.toList(),
                                    'name')
                                ?.toString(),
                          );

                          logFirebaseEvent('Container_update_component_state');
                          _model.removeCounter = _model.removeCounter + 1;
                          safeSetState(() {});
                        }
                        logFirebaseEvent('Container_update_component_state');
                        _model.removeCounter = 0;
                        safeSetState(() {});
                      }),
                    ]);
                    logFirebaseEvent('Container_backend_call');
                    _model.playlist = await LaravelGroup.allPlaylistCall.call(
                      token: FFAppState().Token,
                    );

                    if ((_model.playlist?.succeeded ?? true)) {
                      logFirebaseEvent('Container_update_app_state');
                      FFAppState().PersonalPlaylist =
                          LaravelGroup.allPlaylistCall
                              .dataList(
                                (_model.playlist?.jsonBody ?? ''),
                              )!
                              .toList()
                              .cast<dynamic>();
                      safeSetState(() {});
                    }
                    logFirebaseEvent('Container_update_component_state');
                    _model.loader = false;
                    safeSetState(() {});
                    logFirebaseEvent('Container_bottom_sheet');
                    Navigator.pop(context);

                    safeSetState(() {});
                  },
                  child: Container(
                    width: 345.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Frame_1410149479g_1_(1)_(1).png',
                        ).image,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!_model.loader)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'fe4eianh' /* Save */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF232323),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        if (_model.loader)
                          Lottie.asset(
                            'assets/jsons/PXeYFN70bN.json',
                            width: 100.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
