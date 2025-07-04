import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'saveto_playlist_widget.dart' show SavetoPlaylistWidget;
import 'package:flutter/material.dart';

class SavetoPlaylistModel extends FlutterFlowModel<SavetoPlaylistWidget> {
  ///  Local state fields for this component.

  int counter = 0;

  int removeCounter = 0;

  bool loader = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  bool? refresh;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // Stores action output result for [Backend Call - API (Add to Playlist)] action in Container widget.
  ApiCallResponse? addPlay;
  // Stores action output result for [Backend Call - API (Remove from Playlist)] action in Container widget.
  ApiCallResponse? removePlay;
  // Stores action output result for [Backend Call - API (All Playlist)] action in Container widget.
  ApiCallResponse? playlist;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
