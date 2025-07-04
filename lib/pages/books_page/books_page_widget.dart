import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'books_page_model.dart';
export 'books_page_model.dart';

class BooksPageWidget extends StatefulWidget {
  const BooksPageWidget({super.key});

  static String routeName = 'BooksPage';
  static String routePath = '/libraryPage';

  @override
  State<BooksPageWidget> createState() => _BooksPageWidgetState();
}

class _BooksPageWidgetState extends State<BooksPageWidget> {
  late BooksPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _shortenText(String text, int maxChars) {
    if (text.length <= maxChars) return text;
    return '${text.substring(0, maxChars)}...';
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BooksPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BooksPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).oldLace,
        body: Stack(
          alignment: AlignmentDirectional(0.0, 1.0),
          children: [
            Container(
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'BOOKS_PAGE_PAGE_Icon_ycihmo97_ON_TAP');
                                    logFirebaseEvent('Icon_navigate_back');
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: Color(0xFF436073),
                                    size: 42.0,
                                  ),
                                ),
                                AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'xjm1rrph' /* Books */,
                                  ),
                                  textAlign: TextAlign.center,
                                  minFontSize: 12.0,
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
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Container(
                                  width: 30.0,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                              ..complete(LaravelGroup
                                                  .postsListCall
                                                  .call(
                                            postTypeId: '2',
                                            token: FFAppState().Token,
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .davysGray,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final gridViewPostsListResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                          final book =
                                              LaravelGroup.postsListCall
                                              .dataList(
                                                gridViewPostsListResponse
                                                    .jsonBody,
                                              )
                                              ?.toList() ??
                                          [];
                                      if (book.isEmpty) {
                                        return EmptyWidget();
                                      }

                                      return RefreshIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'BOOKS_GridView_crddldcg_ON_PULL_TO_REFRE');
                                          logFirebaseEvent(
                                              'GridView_refresh_database_request');
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                            child: Expanded(
                                              child: LayoutBuilder(
                                                builder:
                                                    (context, constraints) {
                                                  final screenWidth =
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width;

                                                  // Responsive grid settings
                                                  double maxCrossAxisExtent =
                                                      screenWidth < 400
                                                          ? 180.0
                                                          : screenWidth < 800
                                                              ? 220.0
                                                              : 260.0;
                                                  double crossAxisSpacing =
                                                      screenWidth < 800
                                                          ? 10.0
                                                          : 16.0;
                                                  double mainAxisSpacing =
                                                      screenWidth < 800
                                                          ? 4.0
                                                          : 8.0;
                                                  double childAspectRatio =
                                                       screenWidth < 400
                                                          ? 0.78
                                                          : screenWidth < 800
                                                              ? 0.85
                                                              : 0.7;

                                                  final imageHeight =
                                                      screenWidth < 400
                                                          ? 160.0
                                                          : screenWidth < 800
                                                              ? 180.0
                                                              : 200.0;

                                                  final titleFontSize =
                                                      screenWidth < 400
                                                          ? 11.0
                                                          : screenWidth < 800
                                                              ? 12.0
                                                              : 13.0;

                                                  return GridView.builder(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                          gridDelegate:
                                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent:
                                                          maxCrossAxisExtent,
                                                      crossAxisSpacing:
                                                          crossAxisSpacing,
                                                      mainAxisSpacing:
                                                          mainAxisSpacing,
                                                      childAspectRatio:
                                                          childAspectRatio,
                                                    ),
                                                    itemCount: book.length,
                                          primary: false,
                                          shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, bookIndex) {
                                                      final bookItem =
                                                          book[bookIndex];

                                            return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                                        onTap: () {
                                                context.pushNamed(
                                                            BookPostPageWidget
                                                                .routeName,
                                                  queryParameters: {
                                                              'bookItem':
                                                                  serializeParam(
                                                      bookItem,
                                                                      ParamType
                                                                          .JSON),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                children: [
                                                            /// Book Cover Image
                                                  ClipRRect(
                                                    borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                            12.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                      imageUrl: getJsonField(
                                                        bookItem,
                                                                        r'''$.image''')
                                                                    .toString(),
                                                                width: double
                                                                    .infinity,
                                                                height:
                                                                    imageHeight,
                                                                fit: BoxFit
                                                                    .cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                                  width: double
                                                                      .infinity,
                                                                  height:
                                                                      imageHeight,
                                                                  fit: BoxFit
                                                                      .cover,
                                                      ),
                                                    ),
                                                  ),

                                                            const SizedBox(
                                                                height: 4),

                                                            /// Book Title
                                                          Padding(
                                                            padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          5.0),
                                                            child: Text(
                                                              getJsonField(
                                                                bookItem,
                                                                        r'''$.title''')
                                                                    .toString(),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                        fontSize:
                                                                            titleFontSize,
                                                                      fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.bottomNavBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BottomNavBarWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
        ));
  }
}
