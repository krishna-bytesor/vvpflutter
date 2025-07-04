import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/like_unlike/like_unlike_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'radio_page_widget.dart' show RadioPageWidget;
import 'package:flutter/material.dart';

class RadioPageModel extends FlutterFlowModel<RadioPageWidget> {
  ///  Local state fields for this page.

  String? languageInitial;

  String? placeInitial;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Posts List )] action in RadioPage widget.
  ApiCallResponse? radio;
  // Stores action output result for [Bottom Sheet - RadioFilter] action in Icon widget.
  FilterStruct? radioFilter;
  // Model for LikeUnlike component.
  late LikeUnlikeModel likeUnlikeModel;

  @override
  void initState(BuildContext context) {
    likeUnlikeModel = createModel(context, () => LikeUnlikeModel());
  }

  @override
  void dispose() {
    likeUnlikeModel.dispose();
  }
}
