import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'book_post_page_model.dart';
export 'book_post_page_model.dart';

class BookPostPageWidget extends StatefulWidget {
  const BookPostPageWidget({
    super.key,
    required this.bookItem,
  });

  final dynamic bookItem;

  static String routeName = 'BookPostPage';
  static String routePath = '/bookPost';

  @override
  State<BookPostPageWidget> createState() => _BookPostPageWidgetState();
}

class _BookPostPageWidgetState extends State<BookPostPageWidget> {
  late BookPostPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookPostPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BookPostPage'});
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                        logFirebaseEvent('BOOK_POST_chevron_left_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    Flexible(
                      child: AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'ot62dz5l' /* Book */,
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
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 15.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'BOOK_POST_PAGE_PAGE_Icon_35pldalp_ON_TAP');
                          logFirebaseEvent('Icon_alert_dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Please confirm'),
                                  content: Text(
                                      'Are you sure you want to download this book ?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ) ??
                              false;
                          if (confirmDialogResponse) {
                            logFirebaseEvent('Icon_action_block');
                            await action_blocks.downloadFile(
                              context,
                              fileJson: widget.bookItem,
                            );
                            logFirebaseEvent('Icon_launch_u_r_l');
                            await launchURL(getJsonField(
                              widget.bookItem,
                              r'''$.data''',
                            ).toString());
                          }
                        },
                        child: Icon(
                          Icons.file_download_outlined,
                          color: Color(0xFF436073),
                          size: 32.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    child: custom_widgets.PdfViewer(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      url: getJsonField(
                        widget.bookItem,
                        r'''$.data''',
                      ).toString(),
                      postId: getJsonField(
                        widget.bookItem,
                        r'''$.id''',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
