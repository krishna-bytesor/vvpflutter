import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'playlist_page_widget.dart' show PlaylistPageWidget;
import 'package:flutter/material.dart';

class PlaylistPageModel extends FlutterFlowModel<PlaylistPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Delete Playlist)] action in Icon widget.
  ApiCallResponse? delete;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (All Playlist)] action in Icon widget.
  ApiCallResponse? allPlaylist;
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

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
