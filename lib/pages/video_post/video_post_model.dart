import '/components/like_unlike/like_unlike_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_post_widget.dart' show VideoPostWidget;
import 'package:flutter/material.dart';

class VideoPostModel extends FlutterFlowModel<VideoPostWidget> {
  ///  Local state fields for this page.

  bool showPlayerList = false;

  int currentAudioIndex = 0;

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
