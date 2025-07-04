import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'prabhupada_category_page_widget.dart' show PrabhupadaCategoryPageWidget;
import 'package:flutter/material.dart';

class PrabhupadaCategoryPageModel
    extends FlutterFlowModel<PrabhupadaCategoryPageWidget> {
  ///  Local state fields for this page.

  bool showList = true;

  bool search = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavBarModel.dispose();
  }
}
