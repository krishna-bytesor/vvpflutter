import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'SplashScreen';
  static String routePath = '/splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SplashScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_SCREEN_SplashScreen_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          logFirebaseEvent('SplashScreen_custom_action');
          unawaited(
            () async {
              await actions.getVersion();
            }(),
          );
        }),
        Future(() async {
          logFirebaseEvent('SplashScreen_backend_call');
          _model.postType = await LaravelGroup.postTypeListCall.call();

          if ((_model.postType?.succeeded ?? true)) {
            logFirebaseEvent('SplashScreen_update_app_state');
            FFAppState().PostTypeList = LaravelGroup.postTypeListCall
                .dataList(
                  (_model.postType?.jsonBody ?? ''),
                )!
                .toList()
                .cast<dynamic>();
            safeSetState(() {});
          }
        }),
      ]);
    });
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/splashimg2.png',
                          ).image,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/splashimg1.png',
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.18,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 100.0,
                              color: Colors.black,
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              spreadRadius: 100.0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Flexible(
                          child: AutoSizeText(
                              FFLocalizations.of(context).getText('yujbmzcb'),
                          maxLines: 1,
                          minFontSize: 14,         // don’t go below this
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF6260),
                            fontSize: 25,          // preferred size
                          ),
                        ),
                      ),
                        ].divide(const SizedBox(width: 12)),
    ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SPLASH_SCREEN_Container_hxx0ml85_ON_TAP');
                                    logFirebaseEvent('Container_action_block');
                                    await action_blocks.internet(context);
                                    logFirebaseEvent('Container_backend_call');
                                    _model.userButton =
                                        await LaravelGroup.userCall.call(
                                      token: FFAppState().Token,
                                    );

                                    if ((_model.userButton?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      FFAppState().User =
                                          LaravelGroup.userCall.data(
                                        (_model.userButton?.jsonBody ?? ''),
                                      );
                                      safeSetState(() {});
                                      logFirebaseEvent('Container_navigate_to');

                                      context.goNamed(HomePageWidget.routeName);
                                    } else {
                                      logFirebaseEvent(
                                          'Container_action_block');
                                      await action_blocks.apiHandler(
                                        context,
                                        responseCode:
                                            (_model.userButton?.statusCode ??
                                                200),
                                        body:
                                            (_model.userButton?.jsonBody ?? ''),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: Image.asset(
                                          'assets/images/Frame_1410149479g_1_(1)_(1).png',
                                        ).image,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '2pf5dqrx' /* Explore the teachings */,
                                        ),
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
                                              color: Color(0xFF47391E),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}





