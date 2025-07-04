import '/backend/api_requests/api_calls.dart';
import '/components/account_verified/account_verified_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'verify_code_model.dart';
export 'verify_code_model.dart';

class VerifyCodeWidget extends StatefulWidget {
  const VerifyCodeWidget({
    super.key,
    required this.email,
    required this.isReset,
  });

  final String? email;
  final bool? isReset;

  static String routeName = 'VerifyCode';
  static String routePath = '/verifyCode';

  @override
  State<VerifyCodeWidget> createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  late VerifyCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyCodeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'VerifyCode'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFY_CODE_VerifyCode_ON_INIT_STATE');
      logFirebaseEvent('VerifyCode_timer');
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 15.0, 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'VERIFY_CODE_PAGE_Icon_19x3ksru_ON_TAP');
                        logFirebaseEvent('Icon_navigate_to');

                        context.goNamed(SplashScreenWidget.routeName);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).backGrey,
                        size: 42.0,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText(
                          FFLocalizations.of(context).getText(
                            '2942spcm' /* Verify Code */,
                          ),
                          textAlign: TextAlign.center,
                          minFontSize: 12.0,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    Container(
                      width: 30.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 15.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: Color(0x1AFF6260),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.mobileAlt,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'm06s59kl' /* Please enter the 4 digit code ... */,
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  widget.email!,
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
                                        color: FlutterFlowTheme.of(context)
                                            .backGrey,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 3.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PinCodeTextField(
                                          autoDisposeControllers: false,
                                          appContext: context,
                                          length: 4,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          enableActiveFill: false,
                                          autoFocus: false,
                                          focusNode: _model.pinCodeFocusNode,
                                          enablePinAutofill: false,
                                          errorTextSpace: 16.0,
                                          showCursor: false,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          obscureText: false,
                                          keyboardType: TextInputType.number,
                                          pinTheme: PinTheme(
                                            fieldHeight: 64.0,
                                            fieldWidth: 54.0,
                                            borderWidth: 2.0,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12.0),
                                              bottomRight:
                                                  Radius.circular(12.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                            shape: PinCodeFieldShape.box,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            inactiveColor: Color(0xFFD9D9D9),
                                            selectedColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                          controller: _model.pinCodeController,
                                          onChanged: (_) {},
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          validator: _model
                                              .pinCodeControllerValidator
                                              .asValidator(context),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
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
                                  'VERIFY_CODE_PAGE_Row_qofrxs21_ON_TAP');
                              if (_model.timerMilliseconds != 00) {
                                if (widget.isReset!) {
                                  logFirebaseEvent('Row_backend_call');
                                  _model.forgotresend = await LaravelGroup
                                      .forgotPasswordCall
                                      .call(
                                    email: widget.email,
                                  );

                                  logFirebaseEvent('Row_timer');
                                  _model.timerController.timer
                                      .setPresetTime(mSec: 3000, add: false);
                                  _model.timerController.onResetTimer();

                                  logFirebaseEvent('Row_timer');
                                  _model.timerController.onStartTimer();
                                } else {
                                  logFirebaseEvent('Row_backend_call');
                                  _model.resendOtp =
                                      await LaravelGroup.resendOTPCall.call(
                                    token: FFAppState().Token,
                                  );

                                  logFirebaseEvent('Row_timer');
                                  _model.timerController.timer
                                      .setPresetTime(mSec: 3000, add: false);
                                  _model.timerController.onResetTimer();

                                  logFirebaseEvent('Row_timer');
                                  _model.timerController.onStartTimer();
                                }
                              }

                              safeSetState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5v0tgxcd' /* Resend Code  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'hah1f82f' /* ( */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timerInitialTimeMs,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timerController,
                                  updateStateInterval:
                                      Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) safeSetState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'khgivj6h' /* ) */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'VERIFY_CODE_Container_pp42ycwa_ON_TAP');
                                if (_model.pinCodeController!.text != '') {
                                  if (widget.isReset!) {
                                    logFirebaseEvent('Container_backend_call');
                                    _model.verifyForgot = await LaravelGroup
                                        .forgotPasswordVerifyOtpCall
                                        .call(
                                      email: widget.email,
                                      otp: _model.pinCodeController!.text,
                                    );

                                    if ((_model.verifyForgot?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        SetNewPasswordWidget.routeName,
                                        queryParameters: {
                                          'email': serializeParam(
                                            widget.email,
                                            ParamType.String,
                                          ),
                                          'otp': serializeParam(
                                            _model.pinCodeController!.text,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(LaravelGroup
                                                  .forgotPasswordVerifyOtpCall
                                                  .message(
                                                (_model.verifyForgot
                                                        ?.jsonBody ??
                                                    ''),
                                              )!),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    logFirebaseEvent('Container_backend_call');
                                    _model.emailVerified =
                                        await LaravelGroup.verifyOTPCall.call(
                                      token: FFAppState().Token,
                                      otp: _model.pinCodeController!.text,
                                    );

                                    if ((_model.emailVerified?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: AccountVerifiedWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(getJsonField(
                                                (_model.emailVerified
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString()),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
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
                                }

                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Frame_1410149479g_1_(1)_(1).png',
                                    ).image,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '4fczmafm' /* Verify */,
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
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
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





