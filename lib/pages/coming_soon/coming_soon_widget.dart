import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coming_soon_model.dart';
export 'coming_soon_model.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({
    super.key,
    required this.pageTitle,
  });

  final String? pageTitle;

  static String routeName = 'ComingSoon';
  static String routePath = '/comingSoon';

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  late ComingSoonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ComingSoon'});
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
                              'COMING_SOON_PAGE_chevron_left_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                        },
                      ),
                      AutoSizeText(
                        valueOrDefault<String>(
                          widget.pageTitle,
                          '-',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/comingSoon.png',
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 30.0,
                                decoration: BoxDecoration(),
                              ),
                            ],
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
    );
  }
}
