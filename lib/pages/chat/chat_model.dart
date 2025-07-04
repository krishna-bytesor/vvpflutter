import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  bool notification = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for meesage widget.
  FocusNode? meesageFocusNode;
  TextEditingController? meesageTextController;
  String? Function(BuildContext, String?)? meesageTextControllerValidator;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    meesageFocusNode?.dispose();
    meesageTextController?.dispose();
  }
}
