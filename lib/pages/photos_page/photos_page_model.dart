import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'photos_page_widget.dart' show PhotosPageWidget;
import 'package:flutter/material.dart';

class PhotosPageModel extends FlutterFlowModel<PhotosPageWidget> {
  ///  Local state fields for this page.

  String? languageInitial;

  String? yearInitial;

  String? placeInitial;

  String? festivalInitial;

  String? shlokaInitial;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - Filter] action in Icon widget.
  FilterStruct? filter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
