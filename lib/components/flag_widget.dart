import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flag_model.dart';
export 'flag_model.dart';

class FlagWidget extends StatefulWidget {
  const FlagWidget({
    super.key,
    required this.initial,
  });

  final String? initial;

  @override
  State<FlagWidget> createState() => _FlagWidgetState();
}

class _FlagWidgetState extends State<FlagWidget> {
  late FlagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlagModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      height: 32.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: Container(
                  width: 40.0,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: _model.dropDownValue != null &&
                        _model.dropDownValue != '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        _model.dropDownValue!,
                        width: 44.0,
                        height: 27.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(
                    _model.dropDownValue ??= () {
                      if (widget.initial == 'India') {
                        return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/sp4dxugvx5nx/India.png';
                      } else if (widget.initial == 'Australia') {
                        return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/s18nxpu4lz0e/Australia.png';
                      } else if (widget.initial == 'NewZealand') {
                        return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/bzm4gerwink7/new_zealand.png';
                      } else {
                        return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/sz6srhz156qg/USA.png';
                      }
                    }(),
                  ),
                  options: List<String>.from([
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/sp4dxugvx5nx/India.png',
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/sz6srhz156qg/USA.png',
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/s18nxpu4lz0e/Australia.png',
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/bzm4gerwink7/new_zealand.png'
                  ]),
                  optionLabels: [
                    FFLocalizations.of(context).getText(
                      'fj0tvctp' /* India */,
                    ),
                    FFLocalizations.of(context).getText(
                      'qntmjj9h' /* USA */,
                    ),
                    FFLocalizations.of(context).getText(
                      'fikip32g' /* Australia */,
                    ),
                    FFLocalizations.of(context).getText(
                      's89mesh3' /* New Zealand */,
                    )
                  ],
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownValue = val);
                    logFirebaseEvent(
                        'FLAG_DropDown_us1f3c5b_ON_FORM_WIDGET_SE');
                    logFirebaseEvent('DropDown_update_component_state');
                    _model.set = true;
                    safeSetState(() {});
                  },
                  width: 130.0,
                  height: 32.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 8.0,
                  margin: EdgeInsets.all(0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
