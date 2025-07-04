import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'iskon_bkk_widget.dart' show IskonBkkWidget;
import 'package:flutter/material.dart';

class IskonBkkModel extends FlutterFlowModel<IskonBkkWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for project data
  List<dynamic>? projectData;
  bool isLoadingProjects = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
