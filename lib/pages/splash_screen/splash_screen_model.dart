import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'splash_screen_widget.dart' show SplashScreenWidget;
import 'package:flutter/material.dart';

class SplashScreenModel extends FlutterFlowModel<SplashScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Post Type List)] action in SplashScreen widget.
  ApiCallResponse? postType;
  // Stores action output result for [Backend Call - API (User)] action in Container widget.
  ApiCallResponse? userButton;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
