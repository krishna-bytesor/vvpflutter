import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_message_model.dart';
export 'custom_message_model.dart';

class CustomMessageWidget extends StatefulWidget {
  const CustomMessageWidget({
    super.key,
    required this.message,
  });

  final String? message;

  @override
  State<CustomMessageWidget> createState() => _CustomMessageWidgetState();
}

class _CustomMessageWidgetState extends State<CustomMessageWidget> {
  late CustomMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomMessageModel());
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
      decoration: BoxDecoration(
        color: Color(0xFFFEF8EB),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Color(0xFF28C76F),
              size: 100.0,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 30.0),
                child: Text(
                  widget.message!,
                  textAlign: TextAlign.center,
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
            ),
            Container(
              decoration: BoxDecoration(),
            ),
            Flexible(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOM_MESSAGE_Container_h2z6h8ux_ON_TAP');
                  logFirebaseEvent('Container_dismiss_dialog');
                  Navigator.pop(context);
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
                        'ohwg46yy' /* Continue */,
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
