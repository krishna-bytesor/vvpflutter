import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  Local state fields for this page.

  bool google = false;

  bool apple = false;

  bool signUp = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dtw16k77' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileTextController;
  String? Function(BuildContext, String?)? mobileTextControllerValidator;
  String? _mobileTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j9kr12t9' /* Field is required */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        '8pnvmae8' /* Please enter a valid mobile nu... */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        'jot50bzr' /* Please enter a valid mobile nu... */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3itx4krw' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'wui8ugk7' /* Enter a valid email */,
      );
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ifw1ta24' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'uas1ny13' /* Minimum 8 characters required */,
      );
    }

    if (!RegExp('(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).*').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'zuipcmc8' /* Password must contain at least... */,
      );
    }
    return null;
  }

  // State field(s) for is_disciple widget.
  int? isDiscipleValue;
  FormFieldController<int>? isDiscipleValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in Container widget.
  bool? form;
  // Stores action output result for [Backend Call - API (Register)] action in Container widget.
  ApiCallResponse? register;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  UsersRecord? guser;
  // Stores action output result for [Backend Call - API (Social Login)] action in Row widget.
  ApiCallResponse? registerGoogle;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  UsersRecord? auser;
  // Stores action output result for [Backend Call - API (Social Login)] action in Row widget.
  ApiCallResponse? registerApple;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    mobileTextControllerValidator = _mobileTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    mobileFocusNode?.dispose();
    mobileTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
