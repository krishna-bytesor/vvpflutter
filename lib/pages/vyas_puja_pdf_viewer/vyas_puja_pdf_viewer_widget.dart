import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vyas_puja_pdf_viewer_model.dart';
export 'vyas_puja_pdf_viewer_model.dart';

class VyasPujaPdfViewerWidget extends StatefulWidget {
  const VyasPujaPdfViewerWidget({
    super.key,
    required this.vyasPuja,
  });

  final dynamic vyasPuja;

  static String routeName = 'VyasPujaPdfViewer';
  static String routePath = '/vyasPujaPost156';

  @override
  State<VyasPujaPdfViewerWidget> createState() =>
      _VyasPujaPdfViewerWidgetState();
}

class _VyasPujaPdfViewerWidgetState extends State<VyasPujaPdfViewerWidget> {
  late VyasPujaPdfViewerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VyasPujaPdfViewerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VyasPujaPdfViewer'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                            'VYAS_PUJA_PDF_VIEWER_chevron_left_ICN_ON');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    Flexible(
                      child: AutoSizeText(
                        getJsonField(
                          widget.vyasPuja,
                          r'''$.title''',
                        ).toString(),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        minFontSize: 10.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 15.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'VYAS_PUJA_PDF_VIEWER_Icon_8kbp5ti3_ON_TA');
                          logFirebaseEvent('Icon_launch_u_r_l');
                          unawaited(
                            () async {
                              await launchURL(getJsonField(
                                widget.vyasPuja,
                                r'''$.data''',
                              ).toString());
                            }(),
                          );
                        },
                        child: Icon(
                          Icons.file_download_outlined,
                          color: Color(0xFF436073),
                          size: 32.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    child: custom_widgets.PdfViewer(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      url: getJsonField(
                        widget.vyasPuja,
                        r'''$.data''',
                      ).toString(),
                      postId: getJsonField(
                        widget.vyasPuja,
                        r'''$.id''',
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





