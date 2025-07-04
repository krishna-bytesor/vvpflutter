import '/backend/schema/structs/index.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'video_list_widget.dart' show VideoListWidget;
import 'package:flutter/material.dart';

class VideoListModel extends FlutterFlowModel<VideoListWidget> {
  ///  Local state fields for this page.

  String? languageInitial;

  String? yearInitial;

  String? placeInitial;

  String? festivalInitial;

  String? shlokaInitial;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - Filter] action in Icon widget.
  FilterStruct? filter;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    bottomNavBarModel.dispose();
  }
}
