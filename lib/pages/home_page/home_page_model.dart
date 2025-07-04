import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/side_menu/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (User)] action in HomePage widget.
  ApiCallResponse? user;
  // Stores action output result for [Backend Call - API (All Playlist)] action in HomePage widget.
  ApiCallResponse? playlist;
  // Stores action output result for [Backend Call - API (Posts List )] action in HomePage widget.
  ApiCallResponse? video;
  // Stores action output result for [Backend Call - API (Notes List)] action in HomePage widget.
  ApiCallResponse? notes;
  // Stores action output result for [Custom Action - getFCMToken] action in HomePage widget.
  String? fCmToken;
  // Stores action output result for [Backend Call - API (Initiate Chat)] action in Container widget.
  ApiCallResponse? chat;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatMessagesRecord? query;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsersRecord? swamiQuery;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatMessagesRecord? chatCreated;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for SideMenu component.
  late SideMenuModel sideMenuModel;

  /// Query cache managers for this widget.

  final _bannersManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> banners({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _bannersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBannersCache() => _bannersManager.clear();
  void clearBannersCacheKey(String? uniqueKey) =>
      _bannersManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    sideMenuModel = createModel(context, () => SideMenuModel());
  }

  @override
  void dispose() {
    bottomNavBarModel.dispose();
    sideMenuModel.dispose();

    /// Dispose query cache managers for this widget.

    clearBannersCache();
  }
}
