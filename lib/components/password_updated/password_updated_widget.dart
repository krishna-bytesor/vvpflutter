import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'password_updated_model.dart';
export 'password_updated_model.dart';

class PasswordUpdatedWidget extends StatefulWidget {
  const PasswordUpdatedWidget({super.key});

  @override
  State<PasswordUpdatedWidget> createState() => _PasswordUpdatedWidgetState();
}

class _PasswordUpdatedWidgetState extends State<PasswordUpdatedWidget> {
  late PasswordUpdatedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordUpdatedModel());
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
                  'ayfg9z5k' /* Password Updated! */,
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
                    'm5exh37a' /* Your Password has been updated... */,
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
                  logFirebaseEvent('PASSWORD_UPDATED_Container_v13da9j3_ON_T');
                  logFirebaseEvent('Container_dismiss_dialog');
                  Navigator.pop(context);
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed(SignInPageWidget.routeName);
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
                        'r5ftuduz' /* Continue */,
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
