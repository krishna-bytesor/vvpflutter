import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'create_play_list_model.dart';
export 'create_play_list_model.dart';

class CreatePlayListWidget extends StatefulWidget {
  const CreatePlayListWidget({super.key});

  @override
  State<CreatePlayListWidget> createState() => _CreatePlayListWidgetState();
}

class _CreatePlayListWidgetState extends State<CreatePlayListWidget> {
  late CreatePlayListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePlayListModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final double screenWidth = MediaQuery.of(context).size.width;
    double dialogWidth = screenWidth < 400
        ? screenWidth * 0.95
        : screenWidth < 800
            ? 350
            : 400;
    double padding = screenWidth < 400
        ? 10
        : screenWidth < 800
            ? 20
            : 28;
    double titleFontSize = screenWidth < 400
        ? 15
        : screenWidth < 800
            ? 18
            : 20;
    double textFieldFontSize = screenWidth < 400
        ? 13
        : screenWidth < 800
            ? 16
            : 18;
    double buttonHeight = screenWidth < 400
        ? 40
        : screenWidth < 800
            ? 48
            : 54;
    double buttonFontSize = screenWidth < 400
        ? 15
        : screenWidth < 800
            ? 18
            : 20;
    double closeIconSize = screenWidth < 400
        ? 16
        : screenWidth < 800
            ? 18
            : 20;
    double closeButtonSize = screenWidth < 400
        ? 24
        : screenWidth < 800
            ? 30
            : 36;

    return Stack(
      alignment: AlignmentDirectional(1.0, -1.0),
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            width: dialogWidth,
            decoration: BoxDecoration(
              color: Color(0xFFFEF8EB),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'gzo3z7kg' /* Playlist Name */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).backGrey,
                                fontSize: titleFontSize,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, padding * 0.8, padding * 0.4, padding * 2),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          '7tacmbkw' /* Name of your playlist */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0x80232323),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF232323),
                              fontSize: textFieldFontSize,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CREATE_PLAY_LIST_Container_3thph7h9_ON_T');
                        logFirebaseEvent('Container_backend_call');
                        _model.playlist =
                            await LaravelGroup.createPlaylistCall.call(
                          token: FFAppState().Token,
                          name: _model.textController.text,
                        );

                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().Loader = true;
                        safeSetState(() {});
                        logFirebaseEvent('Container_backend_call');
                        _model.allPlaylist =
                            await LaravelGroup.allPlaylistCall.call(
                          token: FFAppState().Token,
                        );

                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().PersonalPlaylist =
                            LaravelGroup.allPlaylistCall
                                .dataList(
                                  (_model.allPlaylist?.jsonBody ?? ''),
                                )!
                                .toList()
                                .cast<dynamic>();
                        safeSetState(() {});
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().Loader = false;
                        safeSetState(() {});
                        logFirebaseEvent('Container_dismiss_dialog');
                        Navigator.pop(
                            context, (_model.playlist?.succeeded ?? true));

                        safeSetState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                          height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_1410149479g_1_(1)_(1).png',
                            ).image,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!FFAppState().Loader)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'wnyp9wl0' /* Create */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF232323),
                                          fontSize: buttonFontSize,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            if (FFAppState().Loader)
                              Lottie.asset(
                                'assets/jsons/PXeYFN70bN.json',
                                width: 100.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                                animate: true,
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
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('CREATE_PLAY_LIST_Container_3339ij06_ON_T');
            logFirebaseEvent('Container_dismiss_dialog');
            Navigator.pop(context);
          },
          child: Container(
            width: closeButtonSize,
            height: closeButtonSize,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: closeIconSize,
            ),
          ),
        ),
      ],
    );
  }
}
