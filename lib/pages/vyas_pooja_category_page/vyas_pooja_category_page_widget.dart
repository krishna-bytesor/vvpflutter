import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vyas_pooja_category_page_model.dart';
export 'vyas_pooja_category_page_model.dart';

class VyasPoojaCategoryPageWidget extends StatefulWidget {
  const VyasPoojaCategoryPageWidget({super.key});

  static String routeName = 'VyasPoojaCategoryPage';
  static String routePath = '/vyasPoojaCategoryPage';

  @override
  State<VyasPoojaCategoryPageWidget> createState() =>
      _VyasPoojaCategoryPageWidgetState();
}

class _VyasPoojaCategoryPageWidgetState
    extends State<VyasPoojaCategoryPageWidget> {
  late VyasPoojaCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VyasPoojaCategoryPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VyasPoojaCategoryPage'});
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
      future: LaravelGroup.postsListCall.call(
        postTypeId: '8',
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
        final vyasPoojaCategoryPagePostsListResponse = snapshot.data!;

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
                                              'VYAS_POOJA_CATEGORY_chevron_left_ICN_ON_');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.pop();
                                        },
                                      ),
                                      AutoSizeText(
                                        FFLocalizations.of(context).getText(
                                          'z1je2bqu' /* Vyasa Puja */,
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
                                                'VYAS_POOJA_CATEGORY_Icon_nyt7znvq_ON_TAP');
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
                                                'VYAS_POOJA_CATEGORY_chevron_left_ICN_ON_');
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  Duration(milliseconds: 2000),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0xwcl3vu' /* Search  */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
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
                                                        color:
                                                            Color(0x7E232323),
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
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                            _model
                                                                .textController
                                                                ?.clear();
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
                                                'VYAS_POOJA_CATEGORY_Icon_bhaj3jo6_ON_TAP');
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
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final vyasPujaList =
                                            LaravelGroup.postsListCall
                                                    .dataList(
                                                      vyasPoojaCategoryPagePostsListResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];
                                        if (vyasPujaList.isEmpty) {
                                          return EmptyWidget();
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: vyasPujaList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, vyasPujaListIndex) {
                                            final vyasPujaListItem =
                                                vyasPujaList[vyasPujaListIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
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
                                                          'VYAS_POOJA_CATEGORY_Container_360swspb_O');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        VyasPujaPdfViewerWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'vyasPuja':
                                                              serializeParam(
                                                            vyasPujaListItem,
                                                            ParamType.JSON,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  vyasPujaListItem,
                                                                  r'''$.image''',
                                                                ).toString(),
                                                                width: 104.0,
                                                                height: 104.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 104.0,
                                                                  height: 104.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  getJsonField(
                                                                    vyasPujaListItem,
                                                                    r'''$.title''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 2,
                                                                  minFontSize:
                                                                      8.0,
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
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (getJsonField(
                                                                            vyasPujaListItem,
                                                                            r'''$.city''',
                                                                          ) !=
                                                                          null)
                                                                        Text(
                                                                          getJsonField(
                                                                            vyasPujaListItem,
                                                                            r'''$.city''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).backGrey,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                      if ((getJsonField(
                                                                                vyasPujaListItem,
                                                                                r'''$.city''',
                                                                              ) !=
                                                                              null) &&
                                                                          (getJsonField(
                                                                                vyasPujaListItem,
                                                                                r'''$.date''',
                                                                              ) !=
                                                                              null))
                                                                        SizedBox(
                                                                          height:
                                                                              16.0,
                                                                          child:
                                                                              VerticalDivider(
                                                                            thickness:
                                                                                1.0,
                                                                            color:
                                                                                Color(0xFF7ECBC9),
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                            vyasPujaListItem,
                                                                            r'''$.date''',
                                                                          ) !=
                                                                          null)
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            dateTimeFormat(
                                                                              "yyyy",
                                                                              functions.stringToDate(getJsonField(
                                                                                vyasPujaListItem,
                                                                                r'''$.date''',
                                                                              ).toString()),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            '-',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).backGrey,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                    ],
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
                                                ),
                                                Divider(
                                                  thickness: 1.25,
                                                  color: Color(0xFFD9D9D9),
                                                ),
                                              ],
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
              ),
            ));
      },
    );
  }
}
