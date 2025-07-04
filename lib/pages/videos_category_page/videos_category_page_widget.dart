import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/unused/more_option/more_option_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'videos_category_page_model.dart';
export 'videos_category_page_model.dart';

class VideosCategoryPageWidget extends StatefulWidget {
  const VideosCategoryPageWidget({super.key});

  static String routeName = 'VideosCategoryPage';
  static String routePath = '/videos';

  @override
  State<VideosCategoryPageWidget> createState() =>
      _VideosCategoryPageWidgetState();
}

class _VideosCategoryPageWidgetState extends State<VideosCategoryPageWidget> {
  late VideosCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideosCategoryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VideosCategoryPage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: LaravelGroup.categoryListCall.call(
        postTypeId: '7',
        token: FFAppState().Token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).davysGray,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        final videosCategoryPageCategoryListResponse = snapshot.data!;

        return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
                child: Scaffold(
              key: scaffoldKey,
              body: SafeArea(
                child: Container(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!_model.search)
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            'VIDEOS_CATEGORY_chevron_left_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.pop();
                                      },
                                    ),
                                    AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'a8bgc9if' /* Video */,
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
                                      width: 60.0,
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIDEOS_CATEGORY_Icon_9bi1a84b_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon_update_page_state');
                                          _model.search = true;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          size: 32.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.search)
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            'VIDEOS_CATEGORY_chevron_left_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.pop();
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              logFirebaseEvent(
                                                  'VIDEOS_CATEGORY_TextField_pvcqwt42_ON_TE');
                                              logFirebaseEvent(
                                                  'TextField_simple_search');
                                              safeSetState(() {
                                                _model.simpleSearchResults =
                                                    TextSearch(LaravelGroup
                                                            .categoryListCall
                                                            .nameList(
                                                              videosCategoryPageCategoryListResponse
                                                                  .jsonBody,
                                                            )!
                                                            .map((str) =>
                                                                TextSearchItem
                                                                    .fromTerms(
                                                                        str,
                                                                        [str]))
                                                            .toList())
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList();
                                                ;
                                              });
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'xqc31slc' /* Search  */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0x7E232323),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFD9D9D9),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0xFFFEF8EB),
                                            suffixIcon: _model.textController!
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model.textController
                                                          ?.clear();
                                                      logFirebaseEvent(
                                                          'VIDEOS_CATEGORY_TextField_pvcqwt42_ON_TE');
                                                      logFirebaseEvent(
                                                          'TextField_simple_search');
                                                      safeSetState(() {
                                                        _model.simpleSearchResults =
                                                            TextSearch(LaravelGroup
                                                                    .categoryListCall
                                                                    .nameList(
                                                                      videosCategoryPageCategoryListResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .map((str) =>
                                                                        TextSearchItem.fromTerms(
                                                                            str,
                                                                            [
                                                                              str
                                                                            ]))
                                                                    .toList())
                                                                .search(_model
                                                                    .textController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList();
                                                        ;
                                                      });
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
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
                                                color: Color(0xFF232323),
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
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 60.0,
                                      decoration: BoxDecoration(),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIDEOS_CATEGORY_Icon_eeptv95i_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon_update_page_state');
                                          _model.search = false;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
                                          size: 32.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (LaravelGroup.categoryListCall
                                          .dataList(
                                            videosCategoryPageCategoryListResponse
                                                .jsonBody,
                                          )
                                          ?.where((e) =>
                                              getJsonField(
                                                e,
                                                r'''$.is_featured''',
                                              ) ==
                                              functions.stringTOJson('1'))
                                          .toList() !=
                                      null &&
                                  (LaravelGroup.categoryListCall
                                          .dataList(
                                            videosCategoryPageCategoryListResponse
                                                .jsonBody,
                                          )
                                          ?.where((e) =>
                                              getJsonField(
                                                e,
                                                r'''$.is_featured''',
                                              ) ==
                                              functions.stringTOJson('1'))
                                          .toList())!
                                      .isNotEmpty)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VIDEOS_CATEGORY_Image_ntf8ujsj_ON_TAP');
                                      logFirebaseEvent('Image_navigate_to');

                                      context.pushNamed(
                                        VideoListWidget.routeName,
                                        queryParameters: {
                                          'categoryItem': serializeParam(
                                            LaravelGroup.categoryListCall
                                                .dataList(
                                                  videosCategoryPageCategoryListResponse
                                                      .jsonBody,
                                                )
                                                ?.where((e) =>
                                                    getJsonField(
                                                      e,
                                                      r'''$.is_featured''',
                                                    ) ==
                                                    functions.stringTOJson('1'))
                                                .toList()
                                                .firstOrNull,
                                            ParamType.JSON,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        getJsonField(
                                          LaravelGroup.categoryListCall
                                              .dataList(
                                                videosCategoryPageCategoryListResponse
                                                    .jsonBody,
                                              )!
                                              .where((e) =>
                                                  getJsonField(
                                                    e,
                                                    r'''$.is_featured''',
                                                  ) ==
                                                  functions.stringTOJson('1'))
                                              .toList()
                                              .firstOrNull,
                                          r'''$.image''',
                                        ).toString(),
                                        width: 345.0,
                                        height: 220.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 12.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'r0nxmgut' /* Playlist */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF232323),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 60.0,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'VIDEOS_CATEGORY_Icon_izo6n1qr_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon_update_page_state');
                                                          _model.showList =
                                                              false;
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .grid_view_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .backGrey,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'VIDEOS_CATEGORY_Icon_n4g3im3h_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Icon_update_page_state');
                                                          _model.showList =
                                                              true;
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.list_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .backGrey,
                                                          size: 32.0,
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
                                      if (!_model.showList)
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 12.0, 24.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final categoryList = (_model
                                                                    .search &&
                                                                (_model.simpleSearchResults
                                                                        .length >
                                                                    0)
                                                            ? LaravelGroup
                                                                .categoryListCall
                                                                .dataList(
                                                                  videosCategoryPageCategoryListResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.where((e) =>
                                                                    _model
                                                                        .simpleSearchResults
                                                                        .contains(
                                                                            getJsonField(
                                                                      e,
                                                                      r'''$.name''',
                                                                    )
                                                                                .toString()))
                                                                .toList()
                                                            : LaravelGroup
                                                                .categoryListCall
                                                                .dataList(
                                                                videosCategoryPageCategoryListResponse
                                                                    .jsonBody,
                                                              ))
                                                        ?.toList() ??
                                                    [];
                                                if (categoryList.isEmpty) {
                                                  return EmptyWidget();
                                                }

                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 0.7,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      categoryList.length,
                                                  itemBuilder: (context,
                                                      categoryListIndex) {
                                                    final categoryListItem =
                                                        categoryList[
                                                            categoryListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'VIDEOS_CATEGORY_Container_589fzp5i_ON_TA');
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            VideoListWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'categoryItem':
                                                                  serializeParam(
                                                                categoryListItem,
                                                                ParamType.JSON,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (getJsonField(
                                                                    categoryListItem,
                                                                    r'''$.image''',
                                                                  ) !=
                                                                  null)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                  LayoutBuilder(
                                                                    builder: (context, constraints) {
                                                                      final screenWidth = MediaQuery.of(context).size.width;

                                                                      // Set responsive image size
                                                                      final imageSize = screenWidth < 400
                                                                          ? 120.0
                                                                          : screenWidth < 800
                                                                          ? 150.0
                                                                          : 165.0;

                                                                      return ClipRRect(
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                        child: Image.network(
                                                                          getJsonField(
                                                                            categoryListItem,
                                                                            r'''$.image''',
                                                                          ).toString(),
                                                                          width: imageSize,
                                                                          height: imageSize,
                                                                          fit: BoxFit.cover,
                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                            'assets/images/error_image.png',
                                                                            width: imageSize,
                                                                            height: imageSize,
                                                                            fit: BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),

                                                                 ),
                                                              Flexible(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              categoryListItem,
                                                                              r'''$.name''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF232323),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      '${getJsonField(
                                                                        categoryListItem,
                                                                        r'''$.posts_count''',
                                                                      ).toString()} videos',
                                                                      minFontSize:
                                                                          8.0,
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font: GoogleFonts.poppins(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: FlutterFlowTheme.of(context).backGrey,
                                                                            fontSize: 12.0,
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      if (_model.showList)
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 12.0, 24.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final categoryList = (_model
                                                                    .search &&
                                                                (_model.simpleSearchResults
                                                                        .length >
                                                                    0)
                                                            ? LaravelGroup
                                                                .categoryListCall
                                                                .dataList(
                                                                  videosCategoryPageCategoryListResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.where((e) =>
                                                                    _model
                                                                        .simpleSearchResults
                                                                        .contains(
                                                                            getJsonField(
                                                                      e,
                                                                      r'''$.name''',
                                                                    )
                                                                                .toString()))
                                                                .toList()
                                                            : LaravelGroup
                                                                .categoryListCall
                                                                .dataList(
                                                                videosCategoryPageCategoryListResponse
                                                                    .jsonBody,
                                                              ))
                                                        ?.toList() ??
                                                    [];
                                                if (categoryList.isEmpty) {
                                                  return EmptyWidget();
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      categoryList.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 12.0),
                                                  itemBuilder: (context,
                                                      categoryListIndex) {
                                                    final categoryListItem =
                                                        categoryList[
                                                            categoryListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'VIDEOS_CATEGORY_Container_wzl1ywha_ON_TA');
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            VideoListWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'categoryItem':
                                                                  serializeParam(
                                                                categoryListItem,
                                                                ParamType.JSON,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (getJsonField(
                                                                    categoryListItem,
                                                                    r'''$.image''',
                                                                  ) ==
                                                                  null)
                                                                Container(
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.19,
                                                                            -0.72),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Baalkrishna.jpg',
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                82.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                Alignment(-1.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.32,
                                                                            -0.32),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/vvpswami1.png',
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                82.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                Alignment(-1.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.71,
                                                                            0.07),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/AboutImage.png',
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                82.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                Alignment(-1.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (getJsonField(
                                                                    categoryListItem,
                                                                    r'''$.image''',
                                                                  ) !=
                                                                  null)
                                                                Container(
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.19,
                                                                            -0.72),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/vvpswami1.png',
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                82.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                Alignment(-1.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.32,
                                                                            -0.32),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Baalkrishna.jpg',
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                82.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                Alignment(0.0, 0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.71,
                                                                            0.07),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            getJsonField(
                                                                              categoryListItem,
                                                                              r'''$.image''',
                                                                            ).toString(),
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                82.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            errorBuilder: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.png',
                                                                              width: 82.0,
                                                                              height: 82.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                AutoSizeText(
                                                                              getJsonField(
                                                                                categoryListItem,
                                                                                r'''$.name''',
                                                                              ).toString(),
                                                                              minFontSize: 10.0,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF232323),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            getJsonField(
                                                                              categoryListItem,
                                                                              r'''$.posts_count''',
                                                                            ).toString(),
                                                                            minFontSize:
                                                                                8.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).backGrey,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (false)
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              150.0,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: MoreOptionWidget(
                                                                                  key: Key('Keylo3_${categoryListIndex}_of_${categoryList.length}'),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
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
                            ],
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
                ),
              ),
            )));
      },
    );
  }
}
