import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'audio_list_widget.dart' show AudioListWidget;
import 'package:flutter/material.dart';

class AudioListModel extends FlutterFlowModel<AudioListWidget> {
  ///  Local state fields for this page.

  String? languageInitial = '';

  String? yearInitial;

  String? placeInitial;

  String? festivalInitial;

  String? shlokaInitial;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - Filter] action in Icon widget.
  FilterStruct? filter;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Query cache managers for this widget.

  final _audioListPageManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> audioListPage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _audioListPageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAudioListPageCache() => _audioListPageManager.clear();
  void clearAudioListPageCacheKey(String? uniqueKey) =>
      _audioListPageManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    bottomNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearAudioListPageCache();
  }
}
