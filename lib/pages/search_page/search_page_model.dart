import '/backend/api_requests/api_calls.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'dart:async';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter4;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for audi widget.

  PagingController<ApiPagingParams, dynamic>? audiPagingController;
  Function(ApiPagingParams nextPageMarker)? audiApiCall;

  // State field(s) for prabhupad widget.

  PagingController<ApiPagingParams, dynamic>? prabhupadPagingController;
  Function(ApiPagingParams nextPageMarker)? prabhupadApiCall;

  // State field(s) for videos widget.

  PagingController<ApiPagingParams, dynamic>? videosPagingController;
  Function(ApiPagingParams nextPageMarker)? videosApiCall;

  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Query cache managers for this widget.

  final _categoryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> category({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _categoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryCache() => _categoryManager.clear();
  void clearCategoryCacheKey(String? uniqueKey) =>
      _categoryManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    audiPagingController?.dispose();
    prabhupadPagingController?.dispose();
    videosPagingController?.dispose();
    bottomNavBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearCategoryCache();
  }

  /// Additional helper methods.
  Future waitForOnePageForAudi({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (audiPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForPrabhupad({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (prabhupadPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForVideos({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (videosPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setAudiController(
      Function(ApiPagingParams) apiCall,
      ) {
    audiApiCall = apiCall;
    return audiPagingController ??= _createAudiController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createAudiController(
      Function(ApiPagingParams) query,
      ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(audiSearchPostPage);
  }

  void audiSearchPostPage(ApiPagingParams nextPageMarker) =>
      audiApiCall!(nextPageMarker).then((audiSearchPostResponse) {
        final pageItems = (LaravelGroup.searchPostCall
            .dataList(
          audiSearchPostResponse.jsonBody,
        )!
            .where((e) => functions.jsonToint(e, 'post_type_id') == 1)
            .toList() ??
            [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        audiPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
            nextPageNumber: nextPageMarker.nextPageNumber + 1,
            numItems: newNumItems,
            lastResponse: audiSearchPostResponse,
          )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setPrabhupadController(
      Function(ApiPagingParams) apiCall,
      ) {
    prabhupadApiCall = apiCall;
    return prabhupadPagingController ??= _createPrabhupadController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createPrabhupadController(
      Function(ApiPagingParams) query,
      ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(prabhupadSearchPostPage);
  }

  void prabhupadSearchPostPage(ApiPagingParams nextPageMarker) =>
      prabhupadApiCall!(nextPageMarker).then((prabhupadSearchPostResponse) {
        final pageItems = (LaravelGroup.searchPostCall
            .dataList(
          prabhupadSearchPostResponse.jsonBody,
        )!
            .where((e) => functions.jsonToint(e, 'post_type_id') == 3)
            .toList() ??
            [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        prabhupadPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
            nextPageNumber: nextPageMarker.nextPageNumber + 1,
            numItems: newNumItems,
            lastResponse: prabhupadSearchPostResponse,
          )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setVideosController(
      Function(ApiPagingParams) apiCall,
      ) {
    videosApiCall = apiCall;
    return videosPagingController ??= _createVideosController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createVideosController(
      Function(ApiPagingParams) query,
      ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(videosSearchPostPage);
  }

  void videosSearchPostPage(ApiPagingParams nextPageMarker) =>
      videosApiCall!(nextPageMarker).then((videosSearchPostResponse) {
        final pageItems = (LaravelGroup.searchPostCall
            .dataList(
          videosSearchPostResponse.jsonBody,
        )!
            .where((e) => functions.jsonToint(e, 'post_type_id') == 7)
            .toList() ??
            [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        videosPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
            nextPageNumber: nextPageMarker.nextPageNumber + 1,
            numItems: newNumItems,
            lastResponse: videosSearchPostResponse,
          )
              : null,
        );
      });
}
