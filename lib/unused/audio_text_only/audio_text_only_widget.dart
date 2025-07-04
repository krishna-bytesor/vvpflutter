import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audio_text_only_model.dart';
export 'audio_text_only_model.dart';

class AudioTextOnlyWidget extends StatefulWidget {
  const AudioTextOnlyWidget({
    super.key,
    required this.audio,
  });

  final dynamic audio;

  static String routeName = 'AudioTextOnly';
  static String routePath = '/audiotextonly';

  @override
  State<AudioTextOnlyWidget> createState() => _AudioTextOnlyWidgetState();
}

class _AudioTextOnlyWidgetState extends State<AudioTextOnlyWidget> {
  late AudioTextOnlyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioTextOnlyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AudioTextOnly'});
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
                            'AUDIO_TEXT_ONLY_chevron_left_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
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
                        EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  1.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 200.0,
                            child: custom_widgets.MyAudioPlayer(
                              width: double.infinity,
                              height: 200.0,
                              currentIndex: 0,
                              playList:
                                  functions.jsontoListJson(widget.audio!),
                              showShloka: () async {},
                              showTranscript: () async {},
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: double.infinity,
                              minHeight: 200.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFFCFBFA),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(0xFF436073),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 12.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'AUDIO_TEXT_ONLY_Image_581ty2w7_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_expand_image');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    getJsonField(
                                                      widget.audio,
                                                      r'''$.image''',
                                                    ).toString(),
                                                    fit: BoxFit.contain,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  allowRotation: false,
                                                  tag: getJsonField(
                                                    widget.audio,
                                                    r'''$.image''',
                                                  ).toString(),
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: getJsonField(
                                              widget.audio,
                                              r'''$.image''',
                                            ).toString(),
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(17.0),
                                              child: Image.network(
                                                getJsonField(
                                                  widget.audio,
                                                  r'''$.image''',
                                                ).toString(),
                                                width: 110.0,
                                                height: 110.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width: 110.0,
                                                  height: 110.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            getJsonField(
                                              widget.audio,
                                              r'''$.title''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightCoral,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 20.0),
                                    child: Text(
                                      getJsonField(
                                        widget.audio,
                                        r'''$.content''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .backGrey,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.bottomNavBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomNavBarWidget(),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
