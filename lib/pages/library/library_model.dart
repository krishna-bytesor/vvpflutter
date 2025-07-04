import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'library_widget.dart' show LibraryWidget;
import 'package:flutter/material.dart';

class LibraryModel extends FlutterFlowModel<LibraryWidget> {
  ///  State fields for stateful widgets in this page.

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
