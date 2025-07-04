import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'Settings';
  static String routePath = '/settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Settings'});
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
                            'SETTINGS_PAGE_chevron_left_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    AutoSizeText(
                      FFLocalizations.of(context).getText(
                        '6xh5rv3z' /* Settings */,
                      ),
                      textAlign: TextAlign.center,
                      minFontSize: 12.0,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_Container_n5ucs1s0_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed(NotificationWidget.routeName);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.bell,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '7qy7kdzh' /* Notification */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
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
                                'SETTINGS_PAGE_Container_mj9vyz5w_ON_TAP');
                            logFirebaseEvent('Container_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'Are you sure you want to delete your account ?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, false),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, true),
                                            child: Text('Confirm'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent('Container_auth');
                              await authManager.deleteUser(context);
                              logFirebaseEvent('Container_backend_call');
                              await currentUserReference!.delete();
                              logFirebaseEvent('Container_backend_call');
                              _model.delete =
                                  await LaravelGroup.deleteAccountCall.call(
                                token: FFAppState().Token,
                              );

                              if ((_model.delete?.succeeded ?? true)) {
                                logFirebaseEvent('Container_update_app_state');
                                FFAppState().Token = '';
                                FFAppState().Notes = [];
                                FFAppState().PersonalPlaylist = [];
                                safeSetState(() {});
                                logFirebaseEvent('Container_navigate_to');

                                context.goNamed(SplashScreenWidget.routeName);
                              } else {
                                logFirebaseEvent('Container_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(getJsonField(
                                          (_model.delete?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.delete_forever_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'af5v0qrx' /* Delete Account */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}





