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
import 'prabhupada_category_page_model.dart';
import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';
export 'prabhupada_category_page_model.dart';

class PrabhupadaCategoryPageWidget extends StatefulWidget {
  const PrabhupadaCategoryPageWidget({super.key});

  static String routeName = 'PrabhupadaCategoryPage';
  static String routePath = '/prabhupadaCategoryPage';

  @override
  State<PrabhupadaCategoryPageWidget> createState() =>
      _PrabhupadaCategoryPageWidgetState();
}

class _PrabhupadaCategoryPageWidgetState
    extends State<PrabhupadaCategoryPageWidget> {
  late PrabhupadaCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrabhupadaCategoryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PrabhupadaCategoryPage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: LaravelGroup.categoryListCall.call(
        postTypeId: '3',
        token: FFAppState().Token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
          );
        }
        final prabhupadaCategoryPageCategoryListResponse = snapshot.data!;

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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 40.0, 0.0, 0.0),
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
                                            'PRABHUPADA_CATEGORY_chevron_left_ICN_ON_');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.pop();
                                      },
                                    ),
                                    AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        '7k9i1on1' /* Prabhupada */,
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
                                              'PRABHUPADA_CATEGORY_Icon_tmcabckp_ON_TAP');
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
                                              'PRABHUPADA_CATEGORY_chevron_left_ICN_ON_');
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
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  logFirebaseEvent(
                                                      'PRABHUPADA_CATEGORY_TextField_p2sgfzgw_O');
                                                  logFirebaseEvent(
                                                      'TextField_simple_search');
                                                  safeSetState(() {
                                                    _model.simpleSearchResults =
                                                        TextSearch(LaravelGroup
                                                                .categoryListCall
                                                                .nameList(
                                                                  prabhupadaCategoryPageCategoryListResponse
                                                                      .jsonBody,
                                                                )!
                                                                .map((str) => TextSearchItem
                                                                    .fromTerms(
                                                                        str,
                                                                        [str]))
                                                                .toList())
                                                            .search(_model
                                                                .textController
                                                                .text)
                                                            .map(
                                                                (r) => r.object)
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
                                                  '9q6tv90r' /* Search  */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: const Color(
                                                              0x7E232323),
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFD9D9D9),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFFEF8EB),
                                                suffixIcon: _model
                                                        .textController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model.textController
                                                              ?.clear();
                                                          logFirebaseEvent(
                                                              'PRABHUPADA_CATEGORY_TextField_p2sgfzgw_O');
                                                          logFirebaseEvent(
                                                              'TextField_simple_search');
                                                          safeSetState(() {
                                                            _model
                                                                .simpleSearchResults = TextSearch(LaravelGroup
                                                                    .categoryListCall
                                                                    .nameList(
                                                                      prabhupadaCategoryPageCategoryListResponse
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                              'PRABHUPADA_CATEGORY_Icon_kyxzxkwu_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon_update_page_state');
                                          _model.search = false;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .backGrey,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (LaravelGroup.categoryListCall
                                          .dataList(
                                            prabhupadaCategoryPageCategoryListResponse
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
                                            prabhupadaCategoryPageCategoryListResponse
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
                                          'PRABHUPADA_CATEGORY_Image_86g5ru9r_ON_TA');
                                      logFirebaseEvent('Image_navigate_to');

                                      context.pushNamed(
                                        AudioListWidget.routeName,
                                        queryParameters: {
                                          'categoryItem': serializeParam(
                                            LaravelGroup.categoryListCall
                                                .dataList(
                                                  prabhupadaCategoryPageCategoryListResponse
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
                                                prabhupadaCategoryPageCategoryListResponse
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
                                      24.0, 12.0, 24.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'bnzzuon8' /* Playlist */,
                                            ),
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
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 10.0, 0.0),
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
                                                          'PRABHUPADA_CATEGORY_Icon_8ntxdbw1_ON_TAP');
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
                                                          'PRABHUPADA_CATEGORY_Icon_1hbkv9jl_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_update_page_state');
                                                      _model.showList = true;
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.list_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                      if (!_model.showList)
                                        Flexible(
                                          child: Builder(
                                            builder: (context) {
                                              final categoryList = (_model
                                                                  .search &&
                                                              (_model
                                                                  .simpleSearchResults
                                                                  .isNotEmpty)
                                                          ? LaravelGroup
                                                              .categoryListCall
                                                              .dataList(
                                                                prabhupadaCategoryPageCategoryListResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.where((e) =>
                                                                  _model
                                                                      .simpleSearchResults
                                                                      .contains(
                                                                          getJsonField(
                                                                    e,
                                                                    r'''$.name''',
                                                                  ).toString()))
                                                              .toList()
                                                          : LaravelGroup
                                                              .categoryListCall
                                                              .dataList(
                                                              prabhupadaCategoryPageCategoryListResponse
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
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: categoryList.length,
                                                itemBuilder: (context,
                                                    categoryListIndex) {
                                                  final categoryListItem =
                                                      categoryList[
                                                          categoryListIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0, 8.0, 0.0, 0.0),
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
                                                            'PRABHUPADA_CATEGORY_Container_9o1kolcw_O');
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
                                                        child: LayoutBuilder(
                                                          builder: (context, constraints) {
                                                            final screenWidth = MediaQuery.of(context).size.width;
                                                            final isSmallScreen = screenWidth < 400;
                                                            final isTablet = screenWidth >= 600;

                                                            final imageSize = isSmallScreen ? 120.0 : isTablet ? 180.0 : 165.0;
                                                            final titleFontSize = isSmallScreen ? 12.0 : 14.0;
                                                            final subtitleFontSize = isSmallScreen ? 10.0 : 12.0;

                                                            return Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  child: Image.network(
                                                                    getJsonField(categoryListItem, r'''$.image''').toString(),
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
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 0.0),
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SingleChildScrollView(
                                                                        scrollDirection: Axis.horizontal,
                                                                        child: Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(1, 0, 10, 0),
                                                                              child: AnimatedDefaultTextStyle(
                                                                                duration: const Duration(milliseconds: 1000),
                                                                                curve: Curves.linear,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: const Color(0xFF232323),
                                                                                  fontSize: titleFontSize,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                                child: Text(
                                                                                  getJsonField(categoryListItem, r'''$.name''').toString(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      AutoSizeText(
                                                                        '${getJsonField(categoryListItem, r'''$.posts_count''').toString()} audios',
                                                                        minFontSize: 8.0,
                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          font: GoogleFonts.poppins(
                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize: subtitleFontSize,
                                                                          color: FlutterFlowTheme.of(context).backGrey,
                                                                          letterSpacing: 0.0,
                                                                         ),
                                                                      ),
                                                                    ],
                                                                   ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),

                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      if (_model.showList)
                                        Flexible(
                                          child: Builder(
                                            builder: (context) {
                                              final categoryList = (_model
                                                                  .search &&
                                                              (_model
                                                                  .simpleSearchResults
                                                                  .isNotEmpty)
                                                          ? LaravelGroup
                                                              .categoryListCall
                                                              .dataList(
                                                                prabhupadaCategoryPageCategoryListResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.where((e) =>
                                                                  _model
                                                                      .simpleSearchResults
                                                                      .contains(
                                                                          getJsonField(
                                                                    e,
                                                                    r'''$.name''',
                                                                  ).toString()))
                                                              .toList()
                                                          : LaravelGroup
                                                              .categoryListCall
                                                              .dataList(
                                                              prabhupadaCategoryPageCategoryListResponse
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
                                                scrollDirection: Axis.vertical,
                                                itemCount: categoryList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 12.0),
                                                itemBuilder: (context,
                                                    categoryListIndex) {
                                                  final categoryListItem =
                                                      categoryList[
                                                          categoryListIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0, 8.0, 0.0, 0.0),
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
                                                            'PRABHUPADA_CATEGORY_Container_qcix71ce_O');
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
                                                              MainAxisSize.max,
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
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Baalkrishna.jpg',
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              -1.0,
                                                                              0.0),
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
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/vvpswami1.png',
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              -1.0,
                                                                              0.0),
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
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/AboutImage.png',
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              -1.0,
                                                                              0.0),
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
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/vvpswami1.png',
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              -1.0,
                                                                              0.0),
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
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Baalkrishna.jpg',
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
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
                                                                        child: Image
                                                                            .network(
                                                                          getJsonField(
                                                                            categoryListItem,
                                                                            r'''$.image''',
                                                                          ).toString(),
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          errorBuilder: (context, error, stackTrace) =>
                                                                              Image.asset(
                                                                            'assets/images/error_image.png',
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                82.0,
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              AutoSizeText(
                                                                            getJsonField(
                                                                              categoryListItem,
                                                                              r'''$.name''',
                                                                            ).toString(),
                                                                            minFontSize:
                                                                                10.0,
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
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).backGrey,
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
                                                                                key: Key('Keyccl_${categoryListIndex}_of_${categoryList.length}'),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(
                                                              const SizedBox(
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
                                    ].divide(SizedBox(height: 8.0)),
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
            ));
      },
    );
  }
}
