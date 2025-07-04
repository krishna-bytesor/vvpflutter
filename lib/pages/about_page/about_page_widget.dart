import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_page_model.dart';
export 'about_page_model.dart';

class AboutPageWidget extends StatefulWidget {
  const AboutPageWidget({super.key});

  static String routeName = 'AboutPage';
  static String routePath = '/aboutPage';

  @override
  State<AboutPageWidget> createState() => _AboutPageWidgetState();
}

class _AboutPageWidgetState extends State<AboutPageWidget> {
  late AboutPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AboutPage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea (
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                                'ABOUT_PAGE_PAGE_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        AutoSizeText(
                          FFLocalizations.of(context).getText(
                            'lalrl7sr' /* About */,
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
                    FlutterFlowYoutubePlayer(
                      url: 'https://www.youtube.com/watch?v=ZveVDpR4rjE',
                      autoPlay: false,
                      looping: true,
                      mute: false,
                      showControls: true,
                      showFullScreen: true,
                      strictRelatedVideos: true,
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
                                    'hbsjzqcv' /* His Holiness Vedavyasapriya Sw... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context)
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
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'qu3ttsk9' /* Introduction and Early Life
           */
                                        ,
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
                                            color: FlutterFlowTheme.of(context)
                                                .backGrey,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'o57jkpka' /* His Holiness Vedavyasapriya Sw... */,
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '0or3s5q7' /* Contributions to ISKCON and Co... */,
                                      ),
                                      style: TextStyle(
                                        color:
                                            FlutterFlowTheme.of(context).backGrey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '8lnli6tp' /* His Holiness Vedavyasapriya Sw... */,
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'suqp5s2a' /* Establishment of Sri Nathji De... */,
                                      ),
                                      style: TextStyle(
                                        color:
                                            FlutterFlowTheme.of(context).backGrey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'w6cmlv4i' /* The journey to establish the w... */,
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'h5lz9wg6' /* Assisting in the Construction ... */,
                                      ),
                                      style: TextStyle(
                                        color:
                                            FlutterFlowTheme.of(context).backGrey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'q95yut3z' /* When two of His Holiness Tamal... */,
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '4u3dbil9' /* Aspiration to Fulfil Srila Pra... */,
                                      ),
                                      style: TextStyle(
                                        color:
                                            FlutterFlowTheme.of(context).backGrey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'vmykdt39' /* His Holiness Vedavyasapriya Sw... */,
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'edp9yszp' /* Conclusion
           */
                                        ,
                                      ),
                                      style: TextStyle(
                                        color:
                                            FlutterFlowTheme.of(context).backGrey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'deutile5' /* Vedavyasapriya Swami Maharaja'... */,
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FlutterFlowTheme.of(context)
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
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
