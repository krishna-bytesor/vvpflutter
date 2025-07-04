import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'audio_text_only_widget.dart' show AudioTextOnlyWidget;
import 'package:flutter/material.dart';

class AudioTextOnlyModel extends FlutterFlowModel<AudioTextOnlyWidget> {
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
