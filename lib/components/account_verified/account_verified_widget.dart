import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'account_verified_model.dart';
export 'account_verified_model.dart';

class AccountVerifiedWidget extends StatefulWidget {
  const AccountVerifiedWidget({super.key});

  @override
  State<AccountVerifiedWidget> createState() => _AccountVerifiedWidgetState();
}

class _AccountVerifiedWidgetState extends State<AccountVerifiedWidget> {
  late AccountVerifiedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountVerifiedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 357.0,
      decoration: BoxDecoration(
        color: Color(0xFFFEF8EB),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Color(0xFF28C76F),
              size: 100.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'vuiwt3kc' /* Account Verified */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 24.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '16d894t3' /* Your Account has been verified... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).backGrey,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
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
                  logFirebaseEvent('ACCOUNT_VERIFIED_Container_todb2ggw_ON_T');
                  logFirebaseEvent('Container_dismiss_dialog');
                  Navigator.pop(context);
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed(HomePageWidget.routeName);
                },
                child: Container(
                  width: double.infinity,
                  height: 48.0,
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
                        'qlcyg34e' /* Continue */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
