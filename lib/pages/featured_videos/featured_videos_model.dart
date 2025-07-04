import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'featured_videos_widget.dart' show FeaturedVideosWidget;
import 'package:flutter/material.dart';

class FeaturedVideosModel extends FlutterFlowModel<FeaturedVideosWidget> {
  ///  Local state fields for this page.

  String? languageInitial;

  String? yearInitial;

  String? placeInitial;

  String? festivalInitial;

  String? shlokaInitial;

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
