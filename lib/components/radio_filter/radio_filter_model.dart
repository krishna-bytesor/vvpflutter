import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'radio_filter_widget.dart' show RadioFilterWidget;
import 'package:flutter/material.dart';

class RadioFilterModel extends FlutterFlowModel<RadioFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Language widget.
  FormFieldController<List<String>>? languageValueController;
  String? get languageValue => languageValueController?.value?.firstOrNull;
  set languageValue(String? val) =>
      languageValueController?.value = val != null ? [val] : [];
  // State field(s) for Place widget.
  FormFieldController<List<String>>? placeValueController;
  String? get placeValue => placeValueController?.value?.firstOrNull;
  set placeValue(String? val) =>
      placeValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
