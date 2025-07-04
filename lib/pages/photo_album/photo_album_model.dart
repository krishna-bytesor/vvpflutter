import '/flutter_flow/flutter_flow_util.dart';
import 'photo_album_widget.dart' show PhotoAlbumWidget;
import 'package:flutter/material.dart';

class PhotoAlbumModel extends FlutterFlowModel<PhotoAlbumWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
