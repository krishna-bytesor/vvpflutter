import '/components/like_unlike/like_unlike_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'blog_post_model.dart';
import 'package:flutter_html/flutter_html.dart';
export 'blog_post_model.dart';

class BlogPostWidget extends StatefulWidget {
  const BlogPostWidget({
    super.key,
    required this.blogPost,
  });

  final dynamic blogPost;

  static String routeName = 'BlogPost';
  static String routePath = '/blogpost';

  @override
  State<BlogPostWidget> createState() => _BlogPostWidgetState();
}

class _BlogPostWidgetState extends State<BlogPostWidget> {
  late BlogPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BlogPost'});
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
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
                                'BLOG_POST_PAGE_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        AutoSizeText(
                          functions.jsonToint(
                                      widget.blogPost!, 'post_type_id') ==
                                  13
                              ? 'News'
                              : 'Blog',
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).backGrey,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              getJsonField(
                                                widget.blogPost,
                                                r'''$.title''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .likeUnlikeModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: LikeUnlikeWidget(
                                                        post: widget.blogPost!,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        getJsonField(
                                                          widget.blogPost,
                                                          r'''$.author''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        minFontSize: 14.0,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    "yMMMd",
                                                    functions.stringToDate(
                                                        getJsonField(
                                                      widget.blogPost,
                                                      r'''$.date''',
                                                    ).toString()),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 16.0, 8.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Html(
                                        data: getJsonField(
                                          widget.blogPost,
                                          r'''$.content''',
                                        ).toString(),
                                        style: {
                                          "body": Style(
                                            color: FlutterFlowTheme.of(context)
                                                .backGrey,
                                            fontSize: FontSize(14.0),
                                            fontFamily: 'Poppins',
                                          ),
                                          "h1": Style(
                                              fontSize: FontSize(22.0),
                                              fontWeight: FontWeight.bold),
                                          "h2": Style(
                                              fontSize: FontSize(18.0),
                                              fontWeight: FontWeight.bold),
                                          "strong": Style(
                                              fontWeight: FontWeight.bold),
                                          "p": Style(
                                              margin: Margins.only(bottom: 8)),
                                        },
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
