import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future allShare(
  BuildContext context, {
  required String? url,
}) async {
  logFirebaseEvent('AllShare_share');
  await Share.share(
    url!,
    sharePositionOrigin: getWidgetBoundingBox(context),
  );
}

Future likeUnlikePost(
  BuildContext context, {
  required dynamic postItem,
}) async {
  ApiCallResponse? unlike;
  ApiCallResponse? like;

  if (functions.isFavourite(
      getJsonField(
        postItem,
        r'''$.id''',
      ),
      FFAppState().FavouriteList.toList())) {
    logFirebaseEvent('LikeUnlikePost_backend_call');
    unlike = await LaravelGroup.unlikePostCall.call(
      token: FFAppState().Token,
      id: getJsonField(
        postItem,
        r'''$.id''',
      ).toString().toString(),
    );

    if ((unlike.succeeded ?? true)) {
      logFirebaseEvent('LikeUnlikePost_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            getJsonField(
              (unlike.jsonBody ?? ''),
              r'''$.message''',
            ).toString().toString(),
            style: TextStyle(
              color: Color(0xFF232323),
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).oldLace,
        ),
      );
      logFirebaseEvent('LikeUnlikePost_update_app_state');
      FFAppState().removeFromFavouriteList(FFAppState()
          .FavouriteList
          .where((e) =>
              functions.jsonToint(e, 'id') ==
              functions.jsonToint(postItem!, 'id'))
          .toList()
          .firstOrNull!);
      FFAppState().update(() {});
    } else {
      logFirebaseEvent('LikeUnlikePost_alert_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(getJsonField(
                (unlike?.jsonBody ?? ''),
                r'''$.message''',
              ).toString().toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
    }
  } else {
    logFirebaseEvent('LikeUnlikePost_backend_call');
    like = await LaravelGroup.likePostCall.call(
      id: getJsonField(
        postItem,
        r'''$.id''',
      ).toString().toString(),
      token: FFAppState().Token,
    );

    if ((like.succeeded ?? true)) {
      logFirebaseEvent('LikeUnlikePost_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            getJsonField(
              (like.jsonBody ?? ''),
              r'''$.message''',
            ).toString().toString(),
            style: TextStyle(
              color: Color(0xFF232323),
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).oldLace,
        ),
      );
      logFirebaseEvent('LikeUnlikePost_update_app_state');
      FFAppState().addToFavouriteList(postItem!);
      FFAppState().update(() {});
    } else {
      logFirebaseEvent('LikeUnlikePost_alert_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(getJsonField(
                (like?.jsonBody ?? ''),
                r'''$.message''',
              ).toString().toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}

Future downloadFile(
  BuildContext context, {
  required dynamic fileJson,
}) async {
  bool? isDownloaded;

  logFirebaseEvent('DownloadFile_custom_action');
  isDownloaded = await actions.downloadFile(
    fileJson!,
  );
  if (isDownloaded) {
    if (!functions.isFavourite(
        getJsonField(
          fileJson,
          r'''$.id''',
        ),
        FFAppState().DownloadedFiles.toList())) {
      logFirebaseEvent('DownloadFile_update_app_state');
      FFAppState().addToDownloadedFiles(fileJson!);
      FFAppState().update(() {});
    }
    logFirebaseEvent('DownloadFile_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'File has been downloaded',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future internet(BuildContext context) async {
  bool? internet;

  logFirebaseEvent('Internet_custom_action');
  internet = await actions.checkInternetConnection();
  if (!internet) {
    logFirebaseEvent('Internet_navigate_to');

    context.pushNamed(InternetConnectionWidget.routeName);

    return;
  }
}

Future apiHandler(
  BuildContext context, {
  required int? responseCode,
  required dynamic body,
}) async {
  if (responseCode == 401) {
    logFirebaseEvent('ApiHandler_navigate_to');

    context.goNamed(SignInPageWidget.routeName);
  } else {
    logFirebaseEvent('ApiHandler_action_block');
    await action_blocks.internet(context);
  }
}

Future deleteDownloadFile(
  BuildContext context, {
  required dynamic postFile,
}) async {
  bool? fileDeleted;

  logFirebaseEvent('DeleteDownloadFile_custom_action');
  fileDeleted = await actions.downloadFileDelete(
    postFile!,
  );
  if (fileDeleted == true) {
    logFirebaseEvent('DeleteDownloadFile_update_app_state');
    FFAppState().removeFromDownloadedFiles(postFile!);
    FFAppState().update(() {});

    logFirebaseEvent('DeleteDownloadFile_alert_dialog');
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            content: Text('File Deleted Successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      },
    );
  } else {
    logFirebaseEvent('DeleteDownloadFile_alert_dialog');
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: Text('Error'),
            content: Text('Error deleting File'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      },
    );
  }
}
