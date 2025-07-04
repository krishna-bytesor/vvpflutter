import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'set_new_password_widget.dart' show SetNewPasswordWidget;
import 'package:flutter/material.dart';

class SetNewPasswordModel extends FlutterFlowModel<SetNewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  String? _passwordTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j45ozt7m' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'q734djel' /* Minimum 8 characters required */,
      );
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordTextController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordTextController2Validator;
  // Stores action output result for [Backend Call - API (Forgot password Set)] action in Container widget.
  ApiCallResponse? password;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordTextController1Validator = _passwordTextController1Validator;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    passwordFocusNode1?.dispose();
    passwordTextController1?.dispose();

    passwordFocusNode2?.dispose();
    passwordTextController2?.dispose();
  }
}
