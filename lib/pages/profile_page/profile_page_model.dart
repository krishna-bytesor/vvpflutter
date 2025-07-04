import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  DateTime? dob;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rww9ekcy' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for mobileCode widget.
  String? mobileCodeValue;
  FormFieldController<String>? mobileCodeValueController;
  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileTextController;
  String? Function(BuildContext, String?)? mobileTextControllerValidator;
  String? _mobileTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vwwlasnu' /* Field is required */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        '6bv739zb' /* Please enter valid mobile numb... */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        'io18p2md' /* Please enter valid mobile numb... */,
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
        'w5j29t95' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '70reowzx' /* Please enter valid email. */,
      );
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for DobNotUsedDoNotDelete widget.
  FocusNode? dobNotUsedDoNotDeleteFocusNode;
  TextEditingController? dobNotUsedDoNotDeleteTextController;
  String? Function(BuildContext, String?)?
      dobNotUsedDoNotDeleteTextControllerValidator;
  String? _dobNotUsedDoNotDeleteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1ve1pog5' /* Date of Birth is required */,
      );
    }

    return null;
  }

  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for is_disciple widget.
  String? isDiscipleValue;
  FormFieldController<String>? isDiscipleValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mvwsmsc6' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Container widget.
  bool? form;
  // Stores action output result for [Backend Call - API (User Update)] action in Container widget.
  ApiCallResponse? update;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    mobileTextControllerValidator = _mobileTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    dobNotUsedDoNotDeleteTextControllerValidator =
        _dobNotUsedDoNotDeleteTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    mobileFocusNode?.dispose();
    mobileTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    dobNotUsedDoNotDeleteFocusNode?.dispose();
    dobNotUsedDoNotDeleteTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
