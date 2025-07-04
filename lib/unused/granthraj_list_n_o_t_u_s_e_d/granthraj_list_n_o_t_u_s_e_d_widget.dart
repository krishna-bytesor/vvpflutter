import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'granthraj_list_n_o_t_u_s_e_d_model.dart';
export 'granthraj_list_n_o_t_u_s_e_d_model.dart';

class GranthrajListNOTUSEDWidget extends StatefulWidget {
  const GranthrajListNOTUSEDWidget({super.key});

  static String routeName = 'GranthrajListNOTUSED';
  static String routePath = '/granthRajList';

  @override
  State<GranthrajListNOTUSEDWidget> createState() =>
      _GranthrajListNOTUSEDWidgetState();
}

class _GranthrajListNOTUSEDWidgetState
    extends State<GranthrajListNOTUSEDWidget> {
  late GranthrajListNOTUSEDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GranthrajListNOTUSEDModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'GranthrajListNOTUSED'});
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
              logFirebaseEvent('GRANTHRAJ_LIST_N_O_T_U_S_E_D_chevron_lef');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '2issxmn7' /* Granthraj */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model.apiRequestCompleter ??=
                          Completer<ApiCallResponse>()
                            ..complete(LaravelGroup.categoryListCall.call(
                              postTypeId: '2',
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
                        final granth = LaravelGroup.categoryListCall
                                .dataList(
                                  listViewCategoryListResponse.jsonBody,
                                )
                                ?.toList() ??
                            [];
                        if (granth.isEmpty) {
                          return EmptyWidget();
                        }

                        return RefreshIndicator(
                          color: FlutterFlowTheme.of(context).primaryText,
                          onRefresh: () async {
                            logFirebaseEvent(
                                'GRANTHRAJ_LIST_N_O_T_U_S_E_D_Column_bq1e');
                            logFirebaseEvent(
                                'ListView_refresh_database_request');
                            safeSetState(
                                () => _model.apiRequestCompleter = null);
                            await _model.waitForApiRequestCompleted();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: granth.length,
                            itemBuilder: (context, granthIndex) {
                              final granthItem = granth[granthIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'GRANTHRAJ_LIST_N_O_T_U_S_E_D_Container_2');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      GranthrajPageWidget.routeName,
                                      queryParameters: {
                                        'granthItem': serializeParam(
                                          granthItem,
                                          ParamType.JSON,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .davysGray,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    getJsonField(
                                                      granthItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .oldLace,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              getJsonField(
                                                                granthItem,
                                                                r'''$.author''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                                        .oldLace,
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
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                              "d/M/y",
                                                              functions
                                                                  .stringToDate(
                                                                      getJsonField(
                                                                granthItem,
                                                                r'''$.date''',
                                                              ).toString()),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
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
                                                                      .oldLace,
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
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 12.0),
                                          child: Text(
                                            getJsonField(
                                              granthItem,
                                              r'''$.content''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .davysGray,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
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
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
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
