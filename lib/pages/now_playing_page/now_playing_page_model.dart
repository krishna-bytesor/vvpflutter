import '/components/like_unlike/like_unlike_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'now_playing_page_widget.dart' show NowPlayingPageWidget;
import 'package:flutter/material.dart';

class NowPlayingPageModel extends FlutterFlowModel<NowPlayingPageWidget> {
  ///  Local state fields for this page.

  int currentAudioIndex = 0;

  bool showTranscript = false;

  bool showShloka = false;

  ///  State fields for stateful widgets in this page.

  // Model for LikeUnlike component.
  late LikeUnlikeModel likeUnlikeModel;

  @override
  void initState(BuildContext context) {
    likeUnlikeModel = createModel(context, () => LikeUnlikeModel());
  }

  @override
  void dispose() {
    likeUnlikeModel.dispose();
  }
}
