import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'internet_connection_model.dart';
export 'internet_connection_model.dart';

class InternetConnectionWidget extends StatefulWidget {
  const InternetConnectionWidget({super.key});

  static String routeName = 'InternetConnection';
  static String routePath = '/internetConnection';

  @override
  State<InternetConnectionWidget> createState() =>
      _InternetConnectionWidgetState();
}

class _InternetConnectionWidgetState extends State<InternetConnectionWidget> {
  late InternetConnectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InternetConnectionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InternetConnection'});
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'fp7z961m' /* VVP SWAMI */,
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
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 40.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1.0,
                            decoration: BoxDecoration(),
                          ),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 170.0,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  FFAppState().Token != ''
                                      ? 'You\'re offline. Explore downloads?'
                                      : 'You\'re offline. Check your internet connectivity.',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                FFAppState().Token != ''
                                    ? 'Access your downloaded content anytime, even offline! Simply click the link below to get started.'
                                    : 'You\'re currently offline and not signed in. Please connect to the internet and try signing in to continue.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).backGrey,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              if (FFAppState().Token != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .backGrey,
                                      ),
                                    ),
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
                                              'INTERNET_CONNECTION_RichText_jzmwjg2b_ON');
                                          logFirebaseEvent(
                                              'RichText_navigate_to');

                                          context.pushNamed(
                                              DownloadsWidget.routeName);
                                        },
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ukqw987f' /* Go to downloads */,
                                                ),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .backGrey,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'INTERNET_CONNECTION_Container_lo4837xk_O');
                                logFirebaseEvent('Container_custom_action');
                                _model.internett =
                                    await actions.checkInternetConnection();
                                if (_model.internett!) {
                                  logFirebaseEvent('Container_navigate_to');

                                  context.goNamed(SplashScreenWidget.routeName);
                                } else {
                                  logFirebaseEvent('Container_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'No Internet Connection',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
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
                                      'tya80uh0' /* Try Again */,
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
                                          color: Color(0xFF232323),
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
                ],
              ),
            ),
          ),
        ),
      ),
      )
    );
  }
}





