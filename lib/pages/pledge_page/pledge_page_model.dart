import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pledge_page_widget.dart' show PledgePageWidget;
import 'package:flutter/material.dart';

class PledgePageModel extends FlutterFlowModel<PledgePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Pledge Donations)] action in PledgePage widget.
  ApiCallResponse? pledgeDonation;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ukvyrz3z' /* Field is required */,
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
        'q0xalzw3' /* Field is required */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        'koswxgsx' /* Please enter valid mobile numb... */,
      );
    }
    if (val.length > 14) {
      return FFLocalizations.of(context).getText(
        'gtefnxx4' /* Please enter valid mobile numb... */,
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
        '6n7m8mbb' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fle3q0bo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in Container widget.
  bool? form;
  // Stores action output result for [Backend Call - API (Submit Pledge Donation)] action in Container widget.
  ApiCallResponse? pledge;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    mobileTextControllerValidator = _mobileTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
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

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
