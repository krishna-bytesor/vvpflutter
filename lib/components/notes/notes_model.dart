import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notes_widget.dart' show NotesWidget;
import 'package:flutter/material.dart';

class NotesModel extends FlutterFlowModel<NotesWidget> {
  ///  Local state fields for this component.

  String? initialNote;

  bool loader = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Update Note)] action in Container widget.
  ApiCallResponse? update;
  // Stores action output result for [Backend Call - API (Note Post )] action in Container widget.
  ApiCallResponse? note;
  // Stores action output result for [Backend Call - API (Notes List)] action in Container widget.
  ApiCallResponse? noteslist;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
