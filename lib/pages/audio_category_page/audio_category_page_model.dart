import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'audio_category_page_widget.dart' show AudioCategoryPageWidget;
import 'package:flutter/material.dart';

class AudioCategoryPageModel extends FlutterFlowModel<AudioCategoryPageWidget> {
  ///  Local state fields for this page.

  bool showList = true;

  bool search = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Query cache managers for this widget.

  final _audioPageManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> audioPage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _audioPageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAudioPageCache() => _audioPageManager.clear();
  void clearAudioPageCacheKey(String? uniqueKey) =>
      _audioPageManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearAudioPageCache();
  }
}
