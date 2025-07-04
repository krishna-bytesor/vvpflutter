import '/components/like_unlike/like_unlike_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blog_post_widget.dart' show BlogPostWidget;
import 'package:flutter/material.dart';

class BlogPostModel extends FlutterFlowModel<BlogPostWidget> {
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
