import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'prabhupada_model.dart';
import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';
export 'prabhupada_model.dart';

class PrabhupadaWidget extends StatefulWidget {
  const PrabhupadaWidget({super.key});

  static String routeName = 'Prabhupada';
  static String routePath = '/prabhupada';

  @override
  State<PrabhupadaWidget> createState() => _PrabhupadaWidgetState();
}

class _PrabhupadaWidgetState extends State<PrabhupadaWidget> {
  late PrabhupadaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrabhupadaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Prabhupada'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void openMainPlayer(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainPlayerView(),
      ),
    );
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                                'PRABHUPADA_PAGE_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        AutoSizeText(
                          FFLocalizations.of(context).getText(
                            'j13cy696' /* Prabhupada */,
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
                        Container(
                          width: 60.0,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/WhatsApp_Image_2024-08-13_at_22.24.09.jpeg',
                        width: 512.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ehkru8rs' /* His Divine Grace Srila Prabhup... */,
                                  ),
                                  textAlign: TextAlign.center,
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
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'aftxfhpw' /* For millennia the teachings an... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF232323),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'PRABHUPADA_Container_lo8wumet_ON_TAP');
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                              PrabhupadaCategoryPageWidget.routeName);
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
                                '78id4t9h' /* Explore Playlist */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF47391E),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
            ),
          ),
        ));
  }
}
