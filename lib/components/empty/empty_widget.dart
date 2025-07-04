import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_model.dart';
export 'empty_model.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({super.key});

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  late EmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EMPTY_COMP_empty_ON_INIT_STATE');
      logFirebaseEvent('empty_custom_action');
      _model.internet = await actions.checkInternetConnection();
      logFirebaseEvent('empty_update_app_state');
      FFAppState().HasInternet = _model.internet!;
      FFAppState().update(() {});
    });
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
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (valueOrDefault<bool>(
              _model.internet,
              true,
            ))
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 72.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '90g7chec' /* No Records Found */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ytdeeynm' /* It seems that there are no rec... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ],
              ),
            if (!valueOrDefault<bool>(
              _model.internet,
              true,
            ))
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.wifi_off,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 170.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'oma1ikno' /* You're offline. Explore downlo... */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF232323),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'r8ss0kbg' /* Access your downloaded content... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).backGrey,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).backGrey,
                        ),
                      ),
                      child: Visibility(
                        visible: FFAppState().Token != '',
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 6.0, 12.0, 6.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'EMPTY_COMP_RichText_gy4cw6nz_ON_TAP');
                              logFirebaseEvent('RichText_navigate_to');

                              context.pushNamed(DownloadsWidget.routeName);
                            },
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'qfswa8te' /* Go to downloads */,
                                    ),
                                    style: TextStyle(
                                      color:
                                          FlutterFlowTheme.of(context).backGrey,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
