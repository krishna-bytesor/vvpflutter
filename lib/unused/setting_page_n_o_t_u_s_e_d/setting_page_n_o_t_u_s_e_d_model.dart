import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'setting_page_n_o_t_u_s_e_d_widget.dart' show SettingPageNOTUSEDWidget;
import 'package:flutter/material.dart';

class SettingPageNOTUSEDModel
    extends FlutterFlowModel<SettingPageNOTUSEDWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    bottomNavBarModel.dispose();
  }
}
