import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pearl_page_model.dart';
export 'pearl_page_model.dart';

class PearlPageWidget extends StatefulWidget {
  const PearlPageWidget({super.key});

  static String routeName = 'PearlPage';
  static String routePath = '/peralPage';

  @override
  State<PearlPageWidget> createState() => _PearlPageWidgetState();
}

class _PearlPageWidgetState extends State<PearlPageWidget> {
  late PearlPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PearlPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PearlPage'});
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
              logFirebaseEvent('PEARL_PAGE_PAGE_chevron_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'uxp4r3ft' /* Pearl */,
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: FutureBuilder<ApiCallResponse>(
              future:
                  (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(LaravelGroup.postsListCall.call(
                          postTypeId: '5',
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
                    final pearls = LaravelGroup.postsListCall
                            .dataList(
                              listViewPostsListResponse.jsonBody,
                            )
                            ?.toList() ??
                        [];

                    return RefreshIndicator(
                      color: FlutterFlowTheme.of(context).primaryText,
                      onRefresh: () async {
                        logFirebaseEvent(
                            'PEARL_ListView_dkal0gxr_ON_PULL_TO_REFRE');
                        logFirebaseEvent('ListView_refresh_database_request');
                        safeSetState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: pearls.length,
                        itemBuilder: (context, pearlsIndex) {
                          final pearlsItem = pearls[pearlsIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent3,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .davysGray,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              getJsonField(
                                                pearlsItem,
                                                r'''$.title''',
                                              ).toString(),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oldLace,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
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
                                                  'PEARL_PAGE_PAGE_Icon_bh4lyl55_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_action_block');
                                              await action_blocks.allShare(
                                                context,
                                                url: getJsonField(
                                                  pearlsItem,
                                                  r'''$.content''',
                                                ).toString(),
                                              );
                                            },
                                            child: Icon(
                                              Icons.share_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .oldLace,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 8.0, 10.0, 8.0),
                                    child: Text(
                                      getJsonField(
                                        pearlsItem,
                                        r'''$.content''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
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
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
