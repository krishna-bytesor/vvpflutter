import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_widget.dart' show FilterWidget;
import 'package:flutter/material.dart';

class FilterModel extends FlutterFlowModel<FilterWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Language widget.
  FormFieldController<List<String>>? languageValueController;
  String? get languageValue => languageValueController?.value?.firstOrNull;
  set languageValue(String? val) =>
      languageValueController?.value = val != null ? [val] : [];
  // State field(s) for Year widget.
  FormFieldController<List<String>>? yearValueController;
  String? get yearValue => yearValueController?.value?.firstOrNull;
  set yearValue(String? val) =>
      yearValueController?.value = val != null ? [val] : [];
  // State field(s) for Place widget.
  FormFieldController<List<String>>? placeValueController;
  String? get placeValue => placeValueController?.value?.firstOrNull;
  set placeValue(String? val) =>
      placeValueController?.value = val != null ? [val] : [];
  // State field(s) for festival widget.
  FormFieldController<List<String>>? festivalValueController;
  String? get festivalValue => festivalValueController?.value?.firstOrNull;
  set festivalValue(String? val) =>
      festivalValueController?.value = val != null ? [val] : [];
  // State field(s) for shloka widget.
  FormFieldController<List<String>>? shlokaValueController;
  String? get shlokaValue => shlokaValueController?.value?.firstOrNull;
  set shlokaValue(String? val) =>
      shlokaValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
