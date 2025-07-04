import '/components/like_unlike/like_unlike_widget.dart';
import '/components/notes/notes_widget.dart';
import '/components/radio_filter/radio_filter_widget.dart';
import '/components/saveto_playlist/saveto_playlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'radio_page_model.dart';
export 'radio_page_model.dart';

class RadioPageWidget extends StatefulWidget {
  const RadioPageWidget({
    super.key,
    bool? isRadio,
  }) : this.isRadio = isRadio ?? false;

  final bool isRadio;

  static String routeName = 'RadioPage';
  static String routePath = '/radio';

  @override
  State<RadioPageWidget> createState() => _RadioPageWidgetState();
}

class _RadioPageWidgetState extends State<RadioPageWidget> {
  late RadioPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'RadioPage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Row(
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
                            'RADIO_PAGE_PAGE_chevron_left_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    AutoSizeText(
                      FFLocalizations.of(context).getText(
                        'r79sn3ox' /* Now Playing */,
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
                      child: Visibility(
                        visible: false,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'RADIO_PAGE_PAGE_Icon_wm7t7yjr_ON_TAP');
                            logFirebaseEvent('Icon_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: RadioFilterWidget(
                                        languageInitial: _model.languageInitial,
                                        placeInitial: _model.placeInitial,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) =>
                                safeSetState(() => _model.radioFilter = value));

                            logFirebaseEvent('Icon_update_page_state');
                            _model.languageInitial =
                                _model.radioFilter?.language;
                            _model.placeInitial = _model.radioFilter?.place;
                            safeSetState(() {});
                            logFirebaseEvent('Icon_update_app_state');
                            FFAppState().currentAudioTrack = FFAppState()
                                .RadioPlaylist
                                .where((e) => () {
                                      if (_model.radioFilter!.hasLanguage() &&
                                          _model.radioFilter!.hasPlace()) {
                                        return ((getJsonField(
                                                  e,
                                                  r'''$.language''',
                                                ) ==
                                                functions.stringTOJson(
                                                    _model.languageInitial)) &&
                                            (getJsonField(
                                                  e,
                                                  r'''$.city''',
                                                ) ==
                                                functions.stringTOJson(
                                                    _model.placeInitial)));
                                      } else if (_model.radioFilter!
                                          .hasLanguage()) {
                                        return (getJsonField(
                                              e,
                                              r'''$.language''',
                                            ) ==
                                            functions.stringTOJson(
                                                _model.languageInitial));
                                      } else if (_model.radioFilter!
                                          .hasPlace()) {
                                        return (getJsonField(
                                              e,
                                              r'''$.city''',
                                            ) ==
                                            functions.stringTOJson(
                                                _model.placeInitial));
                                      } else {
                                        return true;
                                      }
                                    }())
                                .toList()
                                .firstOrNull!;
                            FFAppState().audioUrl = getJsonField(
                              FFAppState()
                                  .RadioPlaylist
                                  .where((e) => () {
                                        if (_model.radioFilter!.hasLanguage() &&
                                            _model.radioFilter!.hasPlace()) {
                                          return ((getJsonField(
                                                    e,
                                                    r'''$.language''',
                                                  ) ==
                                                  functions.stringTOJson(_model
                                                      .languageInitial)) &&
                                              (getJsonField(
                                                    e,
                                                    r'''$.city''',
                                                  ) ==
                                                  functions.stringTOJson(
                                                      _model.placeInitial)));
                                        } else if (_model.radioFilter!
                                            .hasLanguage()) {
                                          return (getJsonField(
                                                e,
                                                r'''$.language''',
                                              ) ==
                                              functions.stringTOJson(
                                                  _model.languageInitial));
                                        } else if (_model.radioFilter!
                                            .hasPlace()) {
                                          return (getJsonField(
                                                e,
                                                r'''$.city''',
                                              ) ==
                                              functions.stringTOJson(
                                                  _model.placeInitial));
                                        } else {
                                          return true;
                                        }
                                      }())
                                  .toList()
                                  .firstOrNull,
                              r'''$.data''',
                            ).toString();
                            FFAppState().AudioPlayerList = FFAppState()
                                .RadioPlaylist
                                .where((e) => () {
                                      if (_model.radioFilter!.hasLanguage() &&
                                          _model.radioFilter!.hasPlace()) {
                                        return ((getJsonField(
                                                  e,
                                                  r'''$.language''',
                                                ) ==
                                                functions.stringTOJson(
                                                    _model.languageInitial)) &&
                                            (getJsonField(
                                                  e,
                                                  r'''$.city''',
                                                ) ==
                                                functions.stringTOJson(
                                                    _model.placeInitial)));
                                      } else if (_model.radioFilter!
                                          .hasLanguage()) {
                                        return (getJsonField(
                                              e,
                                              r'''$.language''',
                                            ) ==
                                            functions.stringTOJson(
                                                _model.languageInitial));
                                      } else if (_model.radioFilter!
                                          .hasPlace()) {
                                        return (getJsonField(
                                              e,
                                              r'''$.city''',
                                            ) ==
                                            functions.stringTOJson(
                                                _model.placeInitial));
                                      } else {
                                        return true;
                                      }
                                    }())
                                .toList()
                                .cast<dynamic>();
                            FFAppState().AudioPlayerSongIndex = 0;
                            FFAppState().update(() {});

                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.filter_alt_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          22.0, 0.0, 22.0, 250.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0xFFD9D9D9),
                                    width: 1.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 345.0,
                                      height: 345.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          getJsonField(
                                            FFAppState().currentAudioTrack,
                                            r'''$.image''',
                                          ).toString(),
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            FFAppState().currentAudioTrack,
                                            r'''$.title''',
                                          ).toString(),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF232323),
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.shloka_part''',
                                                ) !=
                                                null)
                                              Flexible(
                                                child: AutoSizeText(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .combineTextFromJson(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .currentAudioTrack,
                                                              r'''$.shloka_part''',
                                                            ).toString(),
                                                            getJsonField(
                                                              FFAppState()
                                                                  .currentAudioTrack,
                                                              r'''$.shloka_chapter''',
                                                            ).toString()),
                                                    '-',
                                                  ),
                                                  maxLines: 1,
                                                  minFontSize: 8.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .backGrey,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            if ((getJsonField(
                                                      FFAppState()
                                                          .currentAudioTrack,
                                                      r'''$.city''',
                                                    ) !=
                                                    null) &&
                                                (getJsonField(
                                                      FFAppState()
                                                          .currentAudioTrack,
                                                      r'''$.shloka_part''',
                                                    ) !=
                                                    null))
                                              SizedBox(
                                                height: 16.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: Color(0xFF7ECBC9),
                                                ),
                                              ),
                                            if (getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.city''',
                                                ) !=
                                                null)
                                              AutoSizeText(
                                                getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.city''',
                                                ).toString(),
                                                maxLines: 1,
                                                minFontSize: 8.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .backGrey,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                            if (getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.date''',
                                                ) !=
                                                null)
                                              SizedBox(
                                                height: 16.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: Color(0xFF7ECBC9),
                                                ),
                                              ),
                                            if (getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.date''',
                                                ) !=
                                                null)
                                              AutoSizeText(
                                                valueOrDefault<String>(
                                                  dateTimeFormat(
                                                    "yyyy",
                                                    functions.stringToDate(
                                                        getJsonField(
                                                      FFAppState()
                                                          .currentAudioTrack,
                                                      r'''$.date''',
                                                    ).toString()),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  '-',
                                                ),
                                                maxLines: 1,
                                                minFontSize: 8.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .backGrey,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                            if (getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.author''',
                                                ) !=
                                                null)
                                              SizedBox(
                                                height: 16.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: Color(0xFF7ECBC9),
                                                ),
                                              ),
                                            if (getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.author''',
                                                ) !=
                                                null)
                                              AutoSizeText(
                                                getJsonField(
                                                  FFAppState()
                                                      .currentAudioTrack,
                                                  r'''$.author''',
                                                ).toString(),
                                                maxLines: 1,
                                                minFontSize: 8.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .backGrey,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (functions
                                            .jsonToint(
                                                FFAppState().currentAudioTrack,
                                                'post_type_id')
                                            .toString() !=
                                        '12')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: wrapWithModel(
                                                model: _model.likeUnlikeModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: LikeUnlikeWidget(
                                                  post: FFAppState()
                                                      .currentAudioTrack,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'RADIO_Container_hy8e7i4q_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: NotesWidget(
                                                            post: FFAppState()
                                                                .currentAudioTrack,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                width: 28.0,
                                                height: 28.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.edit_note_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 21.0,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'RADIO_Container_ebnnn1hl_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              SavetoPlaylistWidget(
                                                            post: FFAppState()
                                                                .currentAudioTrack,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                width: 28.0,
                                                height: 28.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.playlist_add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 18.0,
                                                ),
                                              ),
                                            ),
                                            if (false)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'RADIO_Container_pht1iuzq_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_action_block');
                                                  await action_blocks
                                                      .downloadFile(
                                                    context,
                                                    fileJson: FFAppState()
                                                        .currentAudioTrack,
                                                  );
                                                },
                                                child: Container(
                                                  width: 28.0,
                                                  height: 28.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons
                                                        .file_download_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 21.0,
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}





