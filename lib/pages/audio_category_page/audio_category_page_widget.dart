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
import 'audio_category_page_model.dart';
export 'audio_category_page_model.dart';

class AudioCategoryPageWidget extends StatefulWidget {
  const AudioCategoryPageWidget({super.key});

  static String routeName = 'AudioCategoryPage';
  static String routePath = '/audioCategoryPage';

  @override
  State<AudioCategoryPageWidget> createState() =>
      _AudioCategoryPageWidgetState();
}

class _AudioCategoryPageWidgetState extends State<AudioCategoryPageWidget> {
  late AudioCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioCategoryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AudioCategoryPage'});
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
      future: _model.audioPage(
        requestFn: () => LaravelGroup.categoryListCall.call(
          postTypeId: '1',
          token: FFAppState().Token,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return SafeArea (
            child: Scaffold(
              body: Center(
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
        final audioCategoryPageCategoryListResponse = snapshot.data!;

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
                      children: [
                        if (!_model.search)
                          Flexible(
                            child: Row(
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
                                        'AUDIO_CATEGORY_chevron_left_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.pop();
                                  },
                                ),
                                AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'j1lquyc9' /* Audio */,
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
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                          'AUDIO_CATEGORY_Icon_blfbwvkx_ON_TAP');
                                      logFirebaseEvent(
                                          'Icon_update_page_state');
                                      _model.search = true;
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color:
                                          FlutterFlowTheme.of(context).backGrey,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (_model.search)
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
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
                                          'AUDIO_CATEGORY_chevron_left_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.pop();
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 60.0,
                                      decoration: BoxDecoration(),
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
                                                  'AUDIO_CATEGORY_TextField_wo4e5cy9_ON_TEX');
                                              logFirebaseEvent(
                                                  'TextField_simple_search');
                                              safeSetState(() {
                                                _model.simpleSearchResults =
                                                    TextSearch(LaravelGroup
                                                            .categoryListCall
                                                            .nameList(
                                                              audioCategoryPageCategoryListResponse
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
                                              'tl9m7xe8' /* Search  */,
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
                                                          'AUDIO_CATEGORY_TextField_wo4e5cy9_ON_TEX');
                                                      logFirebaseEvent(
                                                          'TextField_simple_search');
                                                      safeSetState(() {
                                                        _model.simpleSearchResults =
                                                            TextSearch(LaravelGroup
                                                                    .categoryListCall
                                                                    .nameList(
                                                                      audioCategoryPageCategoryListResponse
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
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'AUDIO_CATEGORY_Icon_ssx6ao42_ON_TAP');
                                      logFirebaseEvent(
                                          'Icon_update_page_state');
                                      _model.search = false;
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color:
                                          FlutterFlowTheme.of(context).backGrey,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 14.0, 0.0, 4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (LaravelGroup.categoryListCall
                                          .dataList(
                                            audioCategoryPageCategoryListResponse
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
                                            audioCategoryPageCategoryListResponse
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
                                          'AUDIO_CATEGORY_Image_e4lxqkt9_ON_TAP');
                                      logFirebaseEvent('Image_navigate_to');

                                      context.pushNamed(
                                        AudioListWidget.routeName,
                                        queryParameters: {
                                          'categoryItem': serializeParam(
                                            LaravelGroup.categoryListCall
                                                .dataList(
                                                  audioCategoryPageCategoryListResponse
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
                                                audioCategoryPageCategoryListResponse
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
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7bp5brbr' /* Playlist */,
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
                                                            'AUDIO_CATEGORY_Icon_0joufpyh_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_update_page_state');
                                                        _model.showList = false;
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.grid_view_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .backGrey,
                                                        size: 24.0,
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
                                                              'AUDIO_CATEGORY_Icon_v1sj8zxc_ON_TAP');
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
                                                                  audioCategoryPageCategoryListResponse
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
                                                                audioCategoryPageCategoryListResponse
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
                                                        childAspectRatio: () {
                                                          double width = MediaQuery.of(context).size.width;
                                                          if (width < 400) {
                                                            return 0.67; // Smaller screens
                                                          } else if (width < 800) {
                                                            return 0.82; // Medium screens
                                                          } else {
                                                            return 0.8; // Larger screens
                                                          }
                                                        }(),
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
                                                              'AUDIO_CATEGORY_Container_mhn3e1w4_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            AudioListWidget
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
                                                                  ) ==
                                                                  null)
                                                                Flexible(
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/AboutImage.png',
                                                                      width:
                                                                          165.0,
                                                                      height:
                                                                          165.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      alignment:
                                                                          Alignment(
                                                                              -1.0,
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (getJsonField(
                                                                    categoryListItem,
                                                                    r'''$.image''',
                                                                  ) !=
                                                                  null)
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      getJsonField(
                                                                        categoryListItem,
                                                                        r'''$.image''',
                                                                      ).toString(),
                                                                      width:
                                                                          165.0,
                                                                      height:
                                                                          165.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
                                                                        width:
                                                                            165.0,
                                                                        height:
                                                                            165.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    children: [
                                                                      SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  categoryListItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF232323),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      AutoSizeText(
                                                                        '${getJsonField(
                                                                          categoryListItem,
                                                                          r'''$.posts_count''',
                                                                        ).toString()} audios',
                                                                        minFontSize:
                                                                            6.0,
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
                                                                  audioCategoryPageCategoryListResponse
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
                                                                audioCategoryPageCategoryListResponse
                                                                    .jsonBody,
                                                              ))
                                                        ?.toList() ??
                                                    [];
                                                if (categoryList.isEmpty) {
                                                  return EmptyWidget();
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
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
                                                              'AUDIO_CATEGORY_Container_1cxye95i_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            AudioListWidget
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
                                                                          Text(
                                                                            '${getJsonField(
                                                                              categoryListItem,
                                                                              r'''$.posts_count''',
                                                                            ).toString()} audios',
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
                                                                                  key: Key('Keyqu1_${categoryListIndex}_of_${categoryList.length}'),
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
        );
      },
    );
  }
}
