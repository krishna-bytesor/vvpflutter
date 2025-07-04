import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_model.dart';
export 'contact_model.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  static String routeName = 'Contact';
  static String routePath = '/contact';

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  late ContactModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Contact'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFEFDBB6),
                Color(0xFFFAEDD6),
                Color(0xFFFEF7E7),
                Color(0xFFEFDBB6),
                Color(0xFFFAEDD6)
              ],
              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
              begin: AlignmentDirectional(0.31, -1.0),
              end: AlignmentDirectional(-0.31, 1.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.chevron_left,
                        color: Color(0xFF436073),
                        size: 32.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'CONTACT_PAGE_chevron_left_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    AutoSizeText(
                      FFLocalizations.of(context).getText(
                        'ohtr9x34' /* Contact */,
                      ),
                      textAlign: TextAlign.center,
                      minFontSize: 12.0,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Container(
                      width: 60.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '1a9p8isq' /* Help & Support */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF232323),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTACT_PAGE_Container_jymdiqbu_ON_TAP');
                            logFirebaseEvent('Container_send_email');
                            await launchUrl(Uri(
                                scheme: 'mailto',
                                path: 'vvpswami.media@gmail.com',
                                query: {
                                  'subject': 'VVPSwami',
                                }
                                    .entries
                                    .map((MapEntry<String, String> e) =>
                                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                    .join('&')));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.mail_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '45e9vxz8' /* Email */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTACT_PAGE_Container_9bnhjn4y_ON_TAP');
                            logFirebaseEvent('Container_call_number');
                            await launchUrl(Uri(
                              scheme: 'tel',
                              path: '+61411450830',
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.phone_in_talk_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'd9txyabi' /* Talk to us */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTACT_PAGE_Container_131f0q0n_ON_TAP');
                            logFirebaseEvent('Container_launch_u_r_l');
                            await launchURL('https://www.vvpswami.com/');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.globe,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'n75hvjeh' /* Web */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTACT_PAGE_Container_2rub4n8u_ON_TAP');
                            logFirebaseEvent('Container_launch_u_r_l');
                            await launchURL('https://wa.me/61411450830');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'mkihl1k2' /* WhatsApp */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFFD9D9D9),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '4kakhx2c' /* Contact Developer */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF232323),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTACT_PAGE_Container_vok65d7j_ON_TAP');
                            logFirebaseEvent('Container_send_email');
                            await launchUrl(Uri(
                                scheme: 'mailto',
                                path: 'interact@bytesor.com',
                                query: {
                                  'subject': 'VVPSwami',
                                }
                                    .entries
                                    .map((MapEntry<String, String> e) =>
                                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                    .join('&')));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.mail_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '92730i0c' /* Email */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTACT_PAGE_Container_n32d79rb_ON_TAP');
                            logFirebaseEvent('Container_call_number');
                            await launchUrl(Uri(
                              scheme: 'tel',
                              path: '+919500049680',
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.phone_in_talk_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '2xq5ecur' /* Talk to us */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTACT_PAGE_Container_ugi3y0ir_ON_TAP');
                            logFirebaseEvent('Container_launch_u_r_l');
                            await launchURL('http://bytesor.com/');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2E9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.globe,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'lv939j0d' /* Web */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF232323),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    )
    );
  }

}





