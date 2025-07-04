import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_filter_model.dart';
export 'radio_filter_model.dart';

class RadioFilterWidget extends StatefulWidget {
  const RadioFilterWidget({
    super.key,
    this.languageInitial,
    this.placeInitial,
  });

  final String? languageInitial;
  final String? placeInitial;

  @override
  State<RadioFilterWidget> createState() => _RadioFilterWidgetState();
}

class _RadioFilterWidgetState extends State<RadioFilterWidget> {
  late RadioFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioFilterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
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
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'RADIO_FILTER_Draggable_vq2c77ne_ON_TAP');
                            logFirebaseEvent('Draggable_bottom_sheet');
                            Navigator.pop(context);
                          },
                          child: Draggable<String>(
                            data: '',
                            feedback: Material(
                              type: MaterialType.transparency,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Container(
                                  width: 50.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Container(
                                width: 50.0,
                                height: 5.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (FFAppState()
                            .RadioPlaylist
                            .unique((e) => getJsonField(
                                  e,
                                  r'''$.language''',
                                ))
                            .isNotEmpty)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '151qa58j' /* Language : */,
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
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FlutterFlowChoiceChips(
                                    options: FFAppState()
                                        .RadioPlaylist
                                        .unique((e) => getJsonField(
                                              e,
                                              r'''$.language''',
                                            ))
                                        .map((e) => getJsonField(
                                              e,
                                              r'''$.language''',
                                            ))
                                        .toList()
                                        .map((e) => e.toString())
                                        .toList()
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) => safeSetState(() =>
                                        _model.languageValue =
                                            val?.firstOrNull),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                      iconColor: Color(0x00000000),
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                      borderColor: Color(0xFFD9D9D9),
                                      borderWidth: 1.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                      iconColor: Color(0x00000000),
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderColor: Color(0xFFD9D9D9),
                                      borderWidth: 1.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    chipSpacing: 12.0,
                                    rowSpacing: 10.0,
                                    multiselect: false,
                                    initialized: _model.languageValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.languageValueController ??=
                                            FormFieldController<List<String>>(
                                      [
                                        widget.languageInitial != null &&
                                                widget.languageInitial != ''
                                            ? widget.languageInitial!
                                            : ''
                                      ],
                                    ),
                                    wrapped: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState()
                            .RadioPlaylist
                            .unique((e) => getJsonField(
                                  e,
                                  r'''$.city''',
                                ))
                            .isNotEmpty)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'eh9zdwns' /* Place :  */,
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
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FlutterFlowChoiceChips(
                                    options: FFAppState()
                                        .RadioPlaylist
                                        .unique((e) => getJsonField(
                                              e,
                                              r'''$.city''',
                                            ))
                                        .map((e) => getJsonField(
                                              e,
                                              r'''$.city''',
                                            ))
                                        .toList()
                                        .map((e) => e.toString())
                                        .toList()
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) => safeSetState(() =>
                                        _model.placeValue = val?.firstOrNull),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                      iconColor: Color(0x00000000),
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                      borderColor: Color(0xFFD9D9D9),
                                      borderWidth: 1.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                      iconColor: Color(0x00000000),
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderColor: Color(0xFFD9D9D9),
                                      borderWidth: 1.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    chipSpacing: 12.0,
                                    rowSpacing: 10.0,
                                    multiselect: false,
                                    initialized: _model.placeValue != null,
                                    alignment: WrapAlignment.start,
                                    controller: _model.placeValueController ??=
                                        FormFieldController<List<String>>(
                                      [
                                        widget.placeInitial != null &&
                                                widget.placeInitial != ''
                                            ? widget.placeInitial!
                                            : ''
                                      ],
                                    ),
                                    wrapped: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 35.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'RADIO_FILTER_Container_w4pyng02_ON_TAP');
                              logFirebaseEvent('Container_bottom_sheet');
                              Navigator.pop(
                                  context,
                                  FilterStruct(
                                    place: _model.placeValue,
                                    language: _model.languageValue,
                                  ));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Frame_1410149479g_1_(1)_(1).png',
                                  ).image,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '81ueuhgk' /* Apply */,
                                  ),
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
                                        color: Color(0xFF232323),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'RADIO_FILTER_COMP_Text_7260vc2o_ON_TAP');
                                logFirebaseEvent('Text_reset_form_fields');
                                safeSetState(() {
                                  _model.languageValueController?.reset();
                                  _model.placeValueController?.reset();
                                });
                                logFirebaseEvent('Text_bottom_sheet');
                                Navigator.pop(context);
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2tgcmzeu' /* Clear Filters */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
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
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('RADIO_FILTER_Container_2a5prux3_ON_TAP');
                  logFirebaseEvent('Container_bottom_sheet');
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
