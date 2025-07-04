import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'like_unlike_model.dart';
export 'like_unlike_model.dart';

class LikeUnlikeWidget extends StatefulWidget {
  const LikeUnlikeWidget({
    super.key,
    required this.post,
  });

  final dynamic post;

  @override
  State<LikeUnlikeWidget> createState() => _LikeUnlikeWidgetState();
}

class _LikeUnlikeWidgetState extends State<LikeUnlikeWidget> {
  late LikeUnlikeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikeUnlikeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (functions.isFavourite(
            getJsonField(
              widget.post,
              r'''$.id''',
            ),
            FFAppState().FavouriteList.toList()))
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('LIKE_UNLIKE_Container_apg7y19e_ON_TAP');
              logFirebaseEvent('Container_action_block');
              await action_blocks.likeUnlikePost(
                context,
                postItem: widget.post,
              );
            },
            child: Container(
              width: 28.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.favorite,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 18.0,
              ),
            ),
          ),
        if (!functions.isFavourite(
            getJsonField(
              widget.post,
              r'''$.id''',
            ),
            FFAppState().FavouriteList.toList()))
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('LIKE_UNLIKE_Container_xj8gnwrh_ON_TAP');
              logFirebaseEvent('Container_action_block');
              await action_blocks.likeUnlikePost(
                context,
                postItem: widget.post,
              );
            },
            child: Container(
              width: 28.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.favorite_border,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 18.0,
              ),
            ),
          ),
      ],
    );
  }
}
