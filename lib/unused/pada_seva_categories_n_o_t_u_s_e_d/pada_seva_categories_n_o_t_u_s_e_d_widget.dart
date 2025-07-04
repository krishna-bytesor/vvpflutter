import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pada_seva_categories_n_o_t_u_s_e_d_model.dart';
export 'pada_seva_categories_n_o_t_u_s_e_d_model.dart';

class PadaSevaCategoriesNOTUSEDWidget extends StatefulWidget {
  const PadaSevaCategoriesNOTUSEDWidget({super.key});

  static String routeName = 'PadaSevaCategoriesNOTUSED';
  static String routePath = '/padaSevaCategoriesNOTUSED';

  @override
  State<PadaSevaCategoriesNOTUSEDWidget> createState() =>
      _PadaSevaCategoriesNOTUSEDWidgetState();
}

class _PadaSevaCategoriesNOTUSEDWidgetState
    extends State<PadaSevaCategoriesNOTUSEDWidget> {
  late PadaSevaCategoriesNOTUSEDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PadaSevaCategoriesNOTUSEDModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PadaSevaCategoriesNOTUSED'});
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
        backgroundColor: FlutterFlowTheme.of(context).oldLace,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).oldLace,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: Color(0xFF436073),
              size: 32.0,
            ),
            onPressed: () async {
              logFirebaseEvent('PADA_SEVA_CATEGORIES_N_O_T_U_S_E_D_chevr');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: AutoSizeText(
            FFLocalizations.of(context).getText(
              '7sp8oq97' /* Pada Seva */,
            ),
            textAlign: TextAlign.center,
            minFontSize: 12.0,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '1byt65v6' /* Offerings at the  */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(LaravelGroup.categoryListCall.call(
                                    postTypeId: '4',
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
                              final category = LaravelGroup.categoryListCall
                                      .dataList(
                                        listViewCategoryListResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              if (category.isEmpty) {
                                return EmptyWidget();
                              }

                              return RefreshIndicator(
                                color: FlutterFlowTheme.of(context).primaryText,
                                onRefresh: () async {
                                  logFirebaseEvent(
                                      'PADA_SEVA_CATEGORIES_N_O_T_U_S_E_D_ListV');
                                  logFirebaseEvent(
                                      'ListView_refresh_database_request');
                                  safeSetState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: category.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder: (context, categoryIndex) {
                                    final categoryItem =
                                        category[categoryIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PADA_SEVA_CATEGORIES_N_O_T_U_S_E_D_Conta');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            PadaSevaListNOTUSEDWidget.routeName,
                                            queryParameters: {
                                              'category': serializeParam(
                                                getJsonField(
                                                  categoryItem,
                                                  r'''$.name''',
                                                ),
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    getJsonField(
                                                      categoryItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
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
                                                          fontSize: 18.0,
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
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
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
    );
  }
}
