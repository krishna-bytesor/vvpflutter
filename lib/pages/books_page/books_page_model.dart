import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'books_page_widget.dart' show BooksPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BooksPageModel extends FlutterFlowModel<BooksPageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
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
