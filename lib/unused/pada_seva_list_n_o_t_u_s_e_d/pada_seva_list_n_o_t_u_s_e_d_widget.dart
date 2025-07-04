import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pada_seva_list_n_o_t_u_s_e_d_model.dart';
export 'pada_seva_list_n_o_t_u_s_e_d_model.dart';

class PadaSevaListNOTUSEDWidget extends StatefulWidget {
  const PadaSevaListNOTUSEDWidget({
    super.key,
    required this.category,
  });

  final dynamic category;

  static String routeName = 'PadaSevaListNOTUSED';
  static String routePath = '/padaSevaListNOTUSED';

  @override
  State<PadaSevaListNOTUSEDWidget> createState() =>
      _PadaSevaListNOTUSEDWidgetState();
}

class _PadaSevaListNOTUSEDWidgetState extends State<PadaSevaListNOTUSEDWidget> {
  late PadaSevaListNOTUSEDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PadaSevaListNOTUSEDModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PadaSevaListNOTUSED'});
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
              logFirebaseEvent('PADA_SEVA_LIST_N_O_T_U_S_E_D_chevron_lef');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'pm3irnf7' /* Pada Seva */,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model.apiRequestCompleter ??=
                          Completer<ApiCallResponse>()
                            ..complete(LaravelGroup.postsListCall.call(
                              postTypeId: getJsonField(
                                widget.category,
                                r'''$.post_type_id''',
                              ).toString(),
                              categoryId: getJsonField(
                                widget.category,
                                r'''$.id''',
                              ).toString(),
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).davysGray,
                            ),
                          ),
                        ),
                      );
                    }
                    final listViewPostsListResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final padaSevaList = LaravelGroup.postsListCall
                                .dataList(
                                  listViewPostsListResponse.jsonBody,
                                )
                                ?.toList() ??
                            [];
                        if (padaSevaList.isEmpty) {
                          return EmptyWidget();
                        }

                        return RefreshIndicator(
                          color: FlutterFlowTheme.of(context).primaryText,
                          onRefresh: () async {
                            logFirebaseEvent(
                                'PADA_SEVA_LIST_N_O_T_U_S_E_D_ListView_ou');
                            logFirebaseEvent(
                                'ListView_refresh_database_request');
                            safeSetState(
                                () => _model.apiRequestCompleter = null);
                            await _model.waitForApiRequestCompleted();
                          },
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: padaSevaList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, padaSevaListIndex) {
                              final padaSevaListItem =
                                  padaSevaList[padaSevaListIndex];
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
                                        'PADA_SEVA_LIST_N_O_T_U_S_E_D_Container_t');
                                    logFirebaseEvent(
                                        'Container_update_app_state');
                                    FFAppState().currentAudioTrack =
                                        padaSevaListItem;
                                    FFAppState().audioUrl = getJsonField(
                                      padaSevaListItem,
                                      r'''$.data''',
                                    ).toString();
                                    safeSetState(() {});
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      AudioTextOnlyWidget.routeName,
                                      queryParameters: {
                                        'audio': serializeParam(
                                          padaSevaListItem,
                                          ParamType.JSON,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 12.0, 8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                getJsonField(
                                                  padaSevaListItem,
                                                  r'''$.image''',
                                                ).toString(),
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              getJsonField(
                                                padaSevaListItem,
                                                r'''$.title''',
                                              ).toString(),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
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
