import '/backend/api_requests/api_calls.dart';
import '/components/custom_message/custom_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notes_model.dart';
export 'notes_model.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({
    super.key,
    required this.post,
  });

  final dynamic post;

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  late NotesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEFDBB6).withOpacity(0.95),
            Color(0xFFFAEDD6).withOpacity(0.95),
            Color(0xFFFEF7E7).withOpacity(0.95),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color:
                      FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),

            // Close button
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: GestureDetector(
                onTap: () async {
                  logFirebaseEvent('NOTES_COMP_Container_tus68cdd_ON_TAP');
                  logFirebaseEvent('Container_dismiss_dialog');
                  Navigator.pop(context);
                },
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  margin: EdgeInsets.only(right: 16.0, top: 8.0),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context)
                        .primaryText
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context)
                          .primaryText
                          .withOpacity(0.2),
                      width: 1.0,
                    ),
                  ),
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 18.0,
                  ),
                ),
              ),
            ),

            // Main content
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FutureBuilder<ApiCallResponse>(
                future: LaravelGroup.getNotePostCall.call(
                  token: FFAppState().Token,
                  postId: getJsonField(
                    widget.post,
                    r'''$.id''',
                  ).toString(),
                  noteId: functions
                      .getDropdownIdInt(
                          getJsonField(
                            widget.post,
                            r'''$.id''',
                          ),
                          FFAppState().Notes.toList(),
                          'post_id')
                      ?.toString(),
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).davysGray,
                                ),
                                strokeWidth: 3.0,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Loading notes...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .copyWith(
                                    color:
                                        FlutterFlowTheme.of(context).davysGray,
                                    fontSize: 14.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final containerGetNotePostResponse = snapshot.data!;

                  return Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.7,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header section
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFDBB6).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Icon(
                                  Icons.edit_note_rounded,
                                  color: Color(0xFF232323),
                                  size: 24.0,
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context)
                                          .getText('ice792ps'),
                                      style: GoogleFonts.poppins(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF232323),
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      'Capture your thoughts and insights',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color(0xFF232323).withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Divider with gradient
                        Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Color(0xFFD9D9D9).withOpacity(0.5),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16.0),

                        // Rich text editor
                        Flexible(
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: 200.0,
                              maxHeight:
                                  MediaQuery.sizeOf(context).height * 0.35,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: Color(0xFFEFDBB6).withOpacity(0.3),
                                width: 1.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: custom_widgets.RichTextEditor(
                                width: double.infinity,
                                height: double.infinity,
                                currentHtml: getJsonField(
                                          containerGetNotePostResponse.jsonBody,
                                          r'''$.data.note''',
                                        ) !=
                                        null
                                    ? getJsonField(
                                        containerGetNotePostResponse.jsonBody,
                                        r'''$.data.note''',
                                      ).toString()
                                    : '',
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20.0),

                        // Update button
                        Container(
                          width: double.infinity,
                          height: 52.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFEFDBB6),
                                Color(0xFFFAEDD6),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFEFDBB6).withOpacity(0.4),
                                blurRadius: 12.0,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16.0),
                              onTap: () async {
                                logFirebaseEvent(
                                    'NOTES_COMP_Container_h25u5d2l_ON_TAP');
                                if (FFAppState()
                                        .Notes
                                        .where((e) =>
                                            getJsonField(
                                              e,
                                              r'''$.post_id''',
                                            ) ==
                                            getJsonField(
                                              widget.post,
                                              r'''$.id''',
                                            ))
                                        .toList()
                                        .length !=
                                    0) {
                                  logFirebaseEvent(
                                      'Container_update_component_state');
                                  _model.loader = true;
                                  safeSetState(() {});
                                  logFirebaseEvent('Container_backend_call');
                                  _model.update =
                                      await LaravelGroup.updateNoteCall.call(
                                    token: FFAppState().Token,
                                    id: getJsonField(
                                      widget.post,
                                      r'''$.id''',
                                    ).toString(),
                                    note: FFAppState().textFromHtmlEditor,
                                    noteId: getJsonField(
                                      FFAppState()
                                          .Notes
                                          .where((e) =>
                                              getJsonField(
                                                e,
                                                r'''$.post_id''',
                                              ) ==
                                              getJsonField(
                                                widget.post,
                                                r'''$.id''',
                                              ))
                                          .toList()
                                          .firstOrNull,
                                      r'''$.id''',
                                    ).toString(),
                                  );

                                  if ((_model.update?.succeeded ?? true)) {
                                    logFirebaseEvent('Container_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: CustomMessageWidget(
                                              message: ' Note Updated',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                  logFirebaseEvent(
                                      'Container_update_component_state');
                                  _model.loader = false;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent(
                                      'Container_update_component_state');
                                  _model.loader = true;
                                  safeSetState(() {});
                                  logFirebaseEvent('Container_backend_call');
                                  _model.note =
                                      await LaravelGroup.notePostCall.call(
                                    id: getJsonField(
                                      widget.post,
                                      r'''$.id''',
                                    ).toString(),
                                    token: FFAppState().Token,
                                    note: functions.multiLinesToSingle(
                                        FFAppState().textFromHtmlEditor),
                                  );

                                  if ((_model.note?.succeeded ?? true)) {
                                    logFirebaseEvent('Container_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: CustomMessageWidget(
                                              message: ' Note Added',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    logFirebaseEvent('Container_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(getJsonField(
                                              (_model.note?.jsonBody ?? ''),
                                              r'''$.message''',
                                            ).toString()),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  logFirebaseEvent(
                                      'Container_update_component_state');
                                  _model.loader = false;
                                  safeSetState(() {});
                                }

                                logFirebaseEvent('Container_bottom_sheet');
                                Navigator.pop(context);
                                logFirebaseEvent('Container_backend_call');
                                _model.noteslist =
                                    await LaravelGroup.notesListCall.call(
                                  token: FFAppState().Token,
                                );

                                logFirebaseEvent('Container_update_app_state');
                                FFAppState().Notes = LaravelGroup.notesListCall
                                    .notesList(
                                        (_model.noteslist?.jsonBody ?? ''))!
                                    .toList()
                                    .cast<dynamic>();
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Center(
                                child: _model.loader
                                    ? Lottie.asset(
                                        'assets/jsons/PXeYFN70bN.json',
                                        width: 80.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                        animate: true,
                                      )
                                    : Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Frame_1410149479g_1_(1)_(1).png',
                                            ).image,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.save_rounded,
                                              color: Color(0xFF232323),
                                              size: 20.0,
                                            ),
                                            SizedBox(width: 8.0),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText('8yqmz2oh'),
                                              style: GoogleFonts.poppins(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF232323),
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
