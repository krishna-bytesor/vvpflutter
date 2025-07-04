import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'vyas_pooja_category_page_widget.dart' show VyasPoojaCategoryPageWidget;
import 'package:flutter/material.dart';

class VyasPoojaCategoryPageModel
    extends FlutterFlowModel<VyasPoojaCategoryPageWidget> {
  ///  Local state fields for this page.

  bool search = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
