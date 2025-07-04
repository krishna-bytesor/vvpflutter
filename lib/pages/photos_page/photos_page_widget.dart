import '/backend/api_requests/api_calls.dart';
import '/components/empty/empty_widget.dart';
import '/components/filter/filter_widget.dart' as filter;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'photos_page_model.dart';
export 'photos_page_model.dart';

class PhotosPageWidget extends StatefulWidget {
  const PhotosPageWidget({super.key});

  static String routeName = 'PhotosPage';
  static String routePath = '/photos';

  @override
  State<PhotosPageWidget> createState() => _PhotosPageWidgetState();
}

class _PhotosPageWidgetState extends State<PhotosPageWidget> {
  late PhotosPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotosPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PhotosPage'});
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
      child: Scaffold(
        key: scaffoldKey,
        body: FutureBuilder<ApiCallResponse>(
          future: LaravelGroup.postsListCall.call(
            token: FFAppState().Token,
            postTypeId: '6',
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).davysGray,
                    ),
                  ),
                ),
              );
            }
            final containerPostsListResponse = snapshot.data!;

            return Container(
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
                                'PHOTOS_PAGE_PAGE_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        AutoSizeText(
                          FFLocalizations.of(context).getText(
                            'r82kg9i5' /* Gallery */,
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
                          child: Visibility(
                            visible: false,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PHOTOS_PAGE_PAGE_Icon_xod35i4s_ON_TAP');
                                logFirebaseEvent('Icon_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: filter.FilterWidget(
                                            festivalList:
                                                LaravelGroup.postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )!
                                                    .map((e) => getJsonField(
                                                          e,
                                                          r'''$.festival''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e.toString())
                                                    .toList(),
                                            yearList: LaravelGroup.postsListCall
                                                .dataList(
                                                  containerPostsListResponse
                                                      .jsonBody,
                                                )!
                                                .unique((e) => dateTimeFormat(
                                                      "yyyy",
                                                      functions.stringToDate(
                                                          getJsonField(
                                                        e,
                                                        r'''$.date''',
                                                      ).toString()),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))
                                                .map((e) => dateTimeFormat(
                                                      "yyyy",
                                                      functions.stringToDate(
                                                          getJsonField(
                                                        e,
                                                        r'''$.date''',
                                                      ).toString()),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))
                                                .toList(),
                                            placeList:
                                                LaravelGroup.postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )!
                                                    .map((e) => getJsonField(
                                                          e,
                                                          r'''$.city''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e.toString())
                                                    .toList(),
                                            languageList:
                                                LaravelGroup.postsListCall
                                                    .dataList(
                                                      containerPostsListResponse
                                                          .jsonBody,
                                                    )!
                                                    .map((e) => getJsonField(
                                                          e,
                                                          r'''$.language''',
                                                        ))
                                                    .toList()
                                                    .map((e) => e.toString())
                                                    .toList(),
                                            shlokaList: LaravelGroup
                                                .postsListCall
                                                .dataList(
                                                  containerPostsListResponse
                                                      .jsonBody,
                                                )!
                                                .unique((e) => functions
                                                    .combineTextFromJson(
                                                        getJsonField(
                                                          e,
                                                          r'''$.shloka_part''',
                                                        ).toString(),
                                                        getJsonField(
                                                          e,
                                                          r'''$.shloka_chapter''',
                                                        ).toString()))
                                                .map((e) => functions
                                                    .combineTextFromJson(
                                                        getJsonField(
                                                          e,
                                                          r'''$.shloka_part''',
                                                        ).toString(),
                                                        getJsonField(
                                                          e,
                                                          r'''$.shloka_chapter''',
                                                        ).toString()))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) =>
                                    safeSetState(() => _model.filter = value));

                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.filter_alt_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: LaravelGroup.categoryListCall.call(
                            token: FFAppState().Token,
                            postTypeId: '6',
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).davysGray,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewCategoryListResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final photos = LaravelGroup.postsListCall
                                        .dataList(
                                          containerPostsListResponse.jsonBody,
                                        )
                                        ?.unique((e) => getJsonField(
                                              e,
                                              r'''$.category_id''',
                                            ))
                                        .toList() ??
                                    [];
                                if (photos.isEmpty) {
                                  return EmptyWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: photos.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, photosIndex) {
                                    try {
                                      // Validate index bounds
                                      if (photosIndex < 0 ||
                                          photosIndex >= photos.length) {
                                        return SizedBox.shrink();
                                      }

                                      final photosItem = photos[photosIndex];

                                      // Add null check for photosItem
                                      if (photosItem == null) {
                                        return SizedBox.shrink();
                                      }

                                      // Add null checks for critical fields
                                      final categoryId = getJsonField(
                                          photosItem, r'''$.category_id''');
                                      final city = getJsonField(
                                                  photosItem, r'''$.city''')
                                              ?.toString() ??
                                          'ISCKON Temple';
                                      final createdAt = getJsonField(photosItem,
                                                  r'''$.created_at''')
                                              ?.toString() ??
                                          '';

                                      // Validate that we have at least a categoryId
                                      if (categoryId == null) {
                                        return SizedBox.shrink();
                                      }

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF8F2E9),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFFD9D9D9),
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                try {
                                                  logFirebaseEvent(
                                                      'PHOTOS_PAGE_PAGE_Column_g0prgu03_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_navigate_to');

                                                  context.pushNamed(
                                                    PhotoAlbumWidget.routeName,
                                                    queryParameters: {
                                                      'postList':
                                                          serializeParam(
                                                        LaravelGroup
                                                                .postsListCall
                                                                .dataList(
                                                                  containerPostsListResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.where((e) =>
                                                                    getJsonField(
                                                                      e,
                                                                      r'''$.category_id''',
                                                                    ) ==
                                                                    categoryId)
                                                                .toList() ??
                                                            [],
                                                        ParamType.JSON,
                                                        isList: true,
                                                      ),
                                                      'title': serializeParam(
                                                        getJsonField(
                                                              LaravelGroup
                                                                  .categoryListCall
                                                                  .dataList(
                                                                    listViewCategoryListResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.where((e) =>
                                                                      getJsonField(
                                                                        e,
                                                                        r'''$.id''',
                                                                      ) ==
                                                                      categoryId)
                                                                  .toList()
                                                                  .firstOrNull,
                                                              r'''$.name''',
                                                            )?.toString() ??
                                                            'Unknown Category',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } catch (e) {
                                                  print(
                                                      'Error navigating to photo album: $e');
                                                }
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                        child: Image.network(
                                                          getJsonField(
                                                                LaravelGroup
                                                                    .postsListCall
                                                                    .dataList(
                                                                      containerPostsListResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.where((e) =>
                                                                        getJsonField(
                                                                          photosItem,
                                                                          r'''$.category_id''',
                                                                        ) ==
                                                                        getJsonField(
                                                                          e,
                                                                          r'''$.category_id''',
                                                                        ))
                                                                    .toList()
                                                                    .elementAtOrNull(0),
                                                                r'''$.image''',
                                                              )?.toString() ??
                                                              '',
                                                          width: 170.0,
                                                          height: 170.0,
                                                          fit: BoxFit.cover,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Container(
                                                              width: 170.0,
                                                              height: 170.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              child: Icon(
                                                                Icons
                                                                    .image_not_supported_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 48.0,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                      LaravelGroup
                                                                          .postsListCall
                                                                          .dataList(
                                                                            containerPostsListResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              getJsonField(
                                                                                photosItem,
                                                                                r'''$.category_id''',
                                                                              ) ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.category_id''',
                                                                              ))
                                                                          .toList()
                                                                          .elementAtOrNull(1),
                                                                      r'''$.image''',
                                                                    )?.toString() ??
                                                                    '',
                                                                width: 170.0,
                                                                height: 85.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder:
                                                                    (context,
                                                                        error,
                                                                        stackTrace) {
                                                                  return Container(
                                                                    width:
                                                                        170.0,
                                                                    height:
                                                                        85.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    child: Icon(
                                                                      Icons
                                                                          .image_not_supported_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                      LaravelGroup
                                                                          .postsListCall
                                                                          .dataList(
                                                                            containerPostsListResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              getJsonField(
                                                                                photosItem,
                                                                                r'''$.category_id''',
                                                                              ) ==
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.category_id''',
                                                                              ))
                                                                          .toList()
                                                                          .elementAtOrNull(2),
                                                                      r'''$.image''',
                                                                    )?.toString() ??
                                                                    '',
                                                                width: 170.0,
                                                                height: 85.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder:
                                                                    (context,
                                                                        error,
                                                                        stackTrace) {
                                                                  return Container(
                                                                    width:
                                                                        170.0,
                                                                    height:
                                                                        85.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    child: Icon(
                                                                      Icons
                                                                          .image_not_supported_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 1.0))
                                                              .around(SizedBox(
                                                                  height: 1.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 1.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 6.0,
                                                                12.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                      LaravelGroup
                                                                          .categoryListCall
                                                                          .dataList(
                                                                            listViewCategoryListResponse.jsonBody,
                                                                          )
                                                                          ?.where((e) =>
                                                                              getJsonField(
                                                                                e,
                                                                                r'''$.id''',
                                                                              ) ==
                                                                              categoryId)
                                                                          .toList()
                                                                          .firstOrNull,
                                                                      r'''$.name''',
                                                                    )?.toString() ??
                                                                    'Unknown Category',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF232323),
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    city,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF465058),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        3.0,
                                                                        12.0,
                                                                        3.0),
                                                            child: Text(
                                                              _formatDate(
                                                                  createdAt),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: Color(0xFFD9D9D9),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      );
                                    } catch (e) {
                                      print('Error building list item: $e');
                                      return SizedBox.shrink();
                                    }
                                  },
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
            );
          },
        ),
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) {
      return '-';
    }

    try {
      final date = DateTime.parse(dateStr);
      return dateTimeFormat("yyyy", date,
          locale: FFLocalizations.of(context).languageCode);
    } catch (e) {
      return '-';
    }
  }
}
