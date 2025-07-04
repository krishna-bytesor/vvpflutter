import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pada_seva_widget.dart' show PadaSevaWidget;
import 'package:flutter/material.dart';

class PadaSevaModel extends FlutterFlowModel<PadaSevaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    bottomNavBarModel.dispose();
  }
}
