import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'yatras_info_model.dart';
export 'yatras_info_model.dart';

class YatrasInfoWidget extends StatefulWidget {
  const YatrasInfoWidget({
    super.key,
    required this.yatraItem,
  });

  final dynamic yatraItem;

  static String routeName = 'YatrasInfo';
  static String routePath = '/yatrasInfo';

  @override
  State<YatrasInfoWidget> createState() => _YatrasInfoWidgetState();
}

class _YatrasInfoWidgetState extends State<YatrasInfoWidget> {
  late YatrasInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YatrasInfoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'YatrasInfo'});
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
              logFirebaseEvent('YATRAS_INFO_PAGE_chevron_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            getJsonField(
              widget.yatraItem,
              r'''$.title''',
            ).toString(),
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
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (getJsonField(
                      widget.yatraItem,
                      r'''$.acf.image.url''',
                    ) !=
                    null)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).backGrey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        getJsonField(
                          widget.yatraItem,
                          r'''$.image''',
                        ).toString(),
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            getJsonField(
                              widget.yatraItem,
                              r'''$.content''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).backGrey,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
