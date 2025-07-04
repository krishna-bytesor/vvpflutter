import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'tutorial_widget.dart' show TutorialWidget;
import 'package:flutter/material.dart';

class TutorialModel extends FlutterFlowModel<TutorialWidget> {
  /// Query cache managers for this widget.

  final _photosPageManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> photosPage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _photosPageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPhotosPageCache() => _photosPageManager.clear();
  void clearPhotosPageCacheKey(String? uniqueKey) =>
      _photosPageManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearPhotosPageCache();
  }
}
