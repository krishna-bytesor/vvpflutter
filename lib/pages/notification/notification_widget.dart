import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_message/custom_message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  static String routeName = 'Notification';
  static String routePath = '/notification';

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notification'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
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
                            'NOTIFICATION_chevron_left_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    AutoSizeText(
                      FFLocalizations.of(context).getText(
                        'wanu3b8k' /* Notification */,
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
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: SwitchListTile.adaptive(
                            value: _model.switchListTileValue ??=
                                FFAppState().NotificationBool,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.switchListTileValue = newValue);
                              if (newValue) {
                                logFirebaseEvent(
                                    'NOTIFICATION_SwitchListTile_zlz5qtot_ON_');
                                logFirebaseEvent(
                                    'SwitchListTile_update_app_state');
                                FFAppState().NotificationBool =
                                    _model.switchListTileValue!;
                                safeSetState(() {});
                                if (!(await getPermissionStatus(
                                    notificationsPermission))) {
                                  logFirebaseEvent(
                                      'SwitchListTile_request_permissions');
                                  await requestPermission(
                                      notificationsPermission);
                                  if (!(await getPermissionStatus(
                                      notificationsPermission))) {
                                    return;
                                  }
                                }
                                logFirebaseEvent('SwitchListTile_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  notification: _model.switchListTileValue,
                                ));
                                logFirebaseEvent('SwitchListTile_bottom_sheet');
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
                                          child: CustomMessageWidget(
                                            message: FFLocalizations.of(context)
                                                .getText(
                                              '5bgiioar' /* You will now receive notificat... */,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                logFirebaseEvent(
                                    'NOTIFICATION_SwitchListTile_zlz5qtot_ON_');
                                logFirebaseEvent(
                                    'SwitchListTile_update_app_state');
                                FFAppState().NotificationBool =
                                    _model.switchListTileValue!;
                                safeSetState(() {});
                                logFirebaseEvent('SwitchListTile_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  notification: _model.switchListTileValue,
                                ));
                                logFirebaseEvent('SwitchListTile_bottom_sheet');
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
                                          child: CustomMessageWidget(
                                            message: FFLocalizations.of(context)
                                                .getText(
                                              'z8g5ut74' /* You have paused notifications.... */,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }
                            },
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                '13t6p29z' /* Receive divine updates and sta... */,
                              ),
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
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                            activeColor: FlutterFlowTheme.of(context).alternate,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).primaryText,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ],
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





