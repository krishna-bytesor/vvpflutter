import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'filter_model.dart';
export 'filter_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    super.key,
    required this.festivalList,
    required this.yearList,
    required this.placeList,
    required this.languageList,
    required this.shlokaList,
    this.languageInitial,
    this.yearInitial,
    this.placeInitial,
    this.festivalInitial,
    this.shlokaInitial,
  });

  final List<String>? festivalList;
  final List<String>? yearList;
  final List<String>? placeList;
  final List<String>? languageList;
  final List<String>? shlokaList;
  final String? languageInitial;
  final String? yearInitial;
  final String? placeInitial;
  final String? festivalInitial;
  final String? shlokaInitial;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late FilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double headingFontSize = screenWidth < 400
        ? 16.0
        : screenWidth < 800
        ? 18.0
        : 20.0;
    double chipFontSize = screenWidth < 400
        ? 10.0
        : screenWidth < 800
        ? 13.0
        : 15.0;
    double chipSpacing = screenWidth < 400 ? 6.0 : screenWidth < 800 ? 12.0 : 16.0;
    double chipRowSpacing = screenWidth < 400 ? 6.0 : screenWidth < 800 ? 10.0 : 14.0;
    double chipBorderRadius = screenWidth < 400 ? 10.0 : screenWidth < 800 ? 16.0 : 20.0;
    double buttonFontSize = screenWidth < 400 ? 14.0 : screenWidth < 800 ? 16.0 : 18.0;
    double buttonHeight = screenWidth < 400 ? 40.0 : screenWidth < 800 ? 45.0 : 50.0;
    double closeIconSize = screenWidth < 400 ? 14.0 : screenWidth < 800 ? 16.0 : 18.0;
    double closeIconContainer = screenWidth < 400 ? 22.0 : screenWidth < 800 ? 26.0 : 30.0;
    double sectionPadding = screenWidth < 400 ? 8.0 : screenWidth < 800 ? 10.0 : 12.0;
    double containerPadding = screenWidth < 400 ? 12.0 : screenWidth < 800 ? 18.0 : 24.0;
    double topPadding = screenWidth < 400 ? 5.0 : screenWidth < 800 ? 10.0 : 16.0;
    double bottomPadding = screenWidth < 400 ? 20.0 : screenWidth < 800 ? 18.0 : 15.0;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    sectionPadding, topPadding, sectionPadding, 0.0),
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
                    padding: EdgeInsetsDirectional.fromSTEB(
                        containerPadding, topPadding, containerPadding, bottomPadding),
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
                                  'FILTER_COMP_Draggable_y4llnb2m_ON_TAP');
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
                          if (widget.languageList != null &&
                              (widget.languageList)!.isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '96os8fxz' /* Language : */,
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
                                      fontSize: headingFontSize,
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
                                      options: widget.languageList!
                                          .unique((e) => e)
                                          .where((e) => e != 'null')
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
                                      ),
                                      chipSpacing: chipSpacing,
                                      rowSpacing: chipRowSpacing,
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
                          if (widget.yearList != null &&
                              (widget.yearList)!.isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'pcxhvzuq' /* Year :  */,
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
                                      fontSize: headingFontSize,
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
                                      options: widget.yearList!
                                          .unique((e) => e)
                                          .where((e) => e != 'null')
                                          .toList()
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) => safeSetState(() =>
                                      _model.yearValue = val?.firstOrNull),
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
                                      ),
                                      chipSpacing: chipSpacing,
                                      rowSpacing: chipRowSpacing,
                                      multiselect: false,
                                      initialized: _model.yearValue != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model.yearValueController ??=
                                          FormFieldController<List<String>>(
                                            [
                                              widget.yearInitial != null &&
                                                  widget.yearInitial != ''
                                                  ? widget.yearInitial!
                                                  : ''
                                            ],
                                          ),
                                      wrapped: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((widget.placeList != null &&
                              (widget.placeList)!.isNotEmpty) &&
                              !((widget.placeList?.unique((e) => e).length ==
                                  1) &&
                                  widget.placeList!.contains('null')))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'opf0ld6l' /* Place :  */,
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
                                      fontSize: headingFontSize,
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
                                      options: widget.placeList!
                                          .unique((e) => e)
                                          .where((e) => e != 'null')
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
                                      ),
                                      chipSpacing: chipSpacing,
                                      rowSpacing: chipRowSpacing,
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
                          if ((widget.festivalList != null &&
                              (widget.festivalList)!.isNotEmpty) &&
                              !((widget.festivalList?.unique((e) => e).length ==
                                  1) &&
                                  widget.festivalList!.contains('null')))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'fwfqpgo5' /* Festival : */,
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
                                      fontSize: headingFontSize,
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
                                      options: widget.festivalList!
                                          .unique((e) => e)
                                          .where((e) => e != 'null')
                                          .toList()
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) => safeSetState(() =>
                                      _model.festivalValue =
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
                                      ),
                                      chipSpacing: chipSpacing,
                                      rowSpacing: chipRowSpacing,
                                      multiselect: false,
                                      initialized: _model.festivalValue != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                      _model.festivalValueController ??=
                                          FormFieldController<List<String>>(
                                            [
                                              widget.festivalInitial != null &&
                                                  widget.festivalInitial != ''
                                                  ? widget.festivalInitial!
                                                  : ''
                                            ],
                                          ),
                                      wrapped: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((widget.shlokaList != null &&
                              (widget.shlokaList)!.isNotEmpty) &&
                              !((widget.shlokaList?.unique((e) => e).length ==
                                  1) &&
                                  widget.shlokaList!.contains('null')))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'zagfahj4' /* Parts & Chapters : */,
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
                                      fontSize: headingFontSize,
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
                                      options: widget.shlokaList!
                                          .unique((e) => e)
                                          .where((e) => e != 'null')
                                          .toList()
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) => safeSetState(() =>
                                      _model.shlokaValue = val?.firstOrNull),
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
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
                                        borderRadius: BorderRadius.circular(chipBorderRadius),
                                      ),
                                      chipSpacing: chipSpacing,
                                      rowSpacing: chipRowSpacing,
                                      multiselect: false,
                                      initialized: _model.shlokaValue != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model.shlokaValueController ??=
                                          FormFieldController<List<String>>(
                                            [
                                              widget.shlokaInitial != null &&
                                                  widget.shlokaInitial != ''
                                                  ? widget.shlokaInitial!
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
                                    'FILTER_COMP_Container_y2swhdae_ON_TAP');
                                logFirebaseEvent('Container_bottom_sheet');
                                Navigator.pop(
                                    context,
                                    FilterStruct(
                                      festival: _model.festivalValue,
                                      place: _model.placeValue,
                                      year: _model.yearValue,
                                      language: _model.languageValue,
                                      shloka: _model.shlokaValue,
                                    ));
                              },
                              child: Container(
                                width: double.infinity,
                                height: buttonHeight,
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
                                      'par3d7n8' /* Apply */,
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
                                      fontSize: buttonFontSize,
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
                                      'FILTER_COMP_Text_969l9zid_ON_TAP');
                                  logFirebaseEvent('Text_reset_form_fields');
                                  safeSetState(() {
                                    _model.languageValueController?.reset();
                                    _model.yearValueController?.reset();
                                    _model.placeValueController?.reset();
                                    _model.festivalValueController?.reset();
                                    _model.shlokaValueController?.reset();
                                  });
                                  logFirebaseEvent('Text_bottom_sheet');
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '1sqmcae5' /* Clear Filters */,
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
                    logFirebaseEvent('FILTER_COMP_Container_ft3iktlg_ON_TAP');
                    logFirebaseEvent('Container_bottom_sheet');
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: closeIconContainer,
                    height: closeIconContainer,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: BorderRadius.circular(closeIconContainer),
                    ),
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: closeIconSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
