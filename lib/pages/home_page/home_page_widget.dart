import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/side_menu/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          logFirebaseEvent('HomePage_backend_call');
          _model.user = await LaravelGroup.userCall.call(
            token: FFAppState().Token,
          );

          if ((_model.user?.succeeded ?? true)) {
            logFirebaseEvent('HomePage_update_app_state');
            FFAppState().User = LaravelGroup.userCall.data(
              (_model.user?.jsonBody ?? ''),
            );
            safeSetState(() {});
          }
        }),
        Future(() async {
          logFirebaseEvent('HomePage_backend_call');
          _model.playlist = await LaravelGroup.allPlaylistCall.call(
            token: FFAppState().Token,
          );

          logFirebaseEvent('HomePage_update_app_state');
          FFAppState().PersonalPlaylist = LaravelGroup.allPlaylistCall
              .dataList(
            (_model.playlist?.jsonBody ?? ''),
          )!
              .toList()
              .cast<dynamic>();
        }),
        Future(() async {
          logFirebaseEvent('HomePage_backend_call');
          _model.video = await LaravelGroup.postsListCall.call(
            token: FFAppState().Token,
            postTypeId: '7',
          );
        }),
        Future(() async {
          logFirebaseEvent('HomePage_backend_call');
          _model.notes = await LaravelGroup.notesListCall.call(
            token: FFAppState().Token,
          );

          logFirebaseEvent('HomePage_update_app_state');
          FFAppState().Notes = LaravelGroup.notesListCall
              .notesList(
            (_model.notes?.jsonBody ?? ''),
          )!
              .toList()
              .cast<dynamic>();
          safeSetState(() {});
        }),
      ]);
      logFirebaseEvent('HomePage_update_app_state');

      safeSetState(() {});
      logFirebaseEvent('HomePage_custom_action');
      _model.fCmToken = await actions.getFCMToken();
    });
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
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: wrapWithModel(
                  model: _model.sideMenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SideMenuWidget(),
                ),
              ),
            ),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_Icon_6jw3sd2v_ON_TAP');
                                    logFirebaseEvent('Icon_drawer');
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu_outlined,
                                    color: FlutterFlowTheme.of(context).backGrey,
                                    size: 30.0,
                                  ),
                                ),
                              ),
        
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'abkxz8gy' /* VVPS */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/ABout.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (false)
                      FlutterFlowAudioPlayer(
                        audio: Audio.network(
                          'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class10SriCaitanyaCaritamrta.mp3',
                          metas: Metas(
                            id: 'Class10SriCaitanyaCaritamrta.mp3-9d204d41',
                            title: 'Vaibhav',
                          ),
                        ),
                        titleTextStyle:
                        FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontStyle,
                        ),
                        playbackDurationTextStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        fillColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                        playbackButtonColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).alternate,
                        elevation: 4.0,
                        pauseOnNavigate: false,
                        playInBackground: PlayInBackground.enabled,
                      ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: FutureBuilder<ApiCallResponse>(
                                future: _model.banners(
                                  requestFn: () => LaravelGroup.bannersCall.call(
                                    token: FFAppState().Token,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .davysGray,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final carouselBannersResponse = snapshot.data!;
        
                                  return Builder(
                                    builder: (context) {
                                      final banners = LaravelGroup.bannersCall
                                          .dataList(
                                        carouselBannersResponse.jsonBody,
                                      )
                                          ?.toList() ??
                                          [];
        
                                      return Container(
                                        width: double.infinity,
                                        height: 160.0,
                                        child: CarouselSlider.builder(
                                          itemCount: banners.length,
                                          itemBuilder:
                                              (context, bannersIndex, _) {
                                            final bannersItem =
                                            banners[bannersIndex];
                                            return Container(
                                              width: 300.0,
                                              height: 200.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                  CachedNetworkImageProvider(
                                                    getJsonField(
                                                      bannersItem,
                                                      r'''$.image_url''',
                                                    ).toString(),
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    14.0, 24.0, 75.0, 14.0),
                                                child: Text(
                                                  getJsonField(
                                                    bannersItem,
                                                    r'''$.text''',
                                                  ).toString(),
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
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontStyle:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .fontStyle,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                          _model.carouselController1 ??=
                                              CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0, min(1, banners.length - 1)),
                                            viewportFraction: 1.0,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                            Duration(milliseconds: 1000),
                                            autoPlayInterval: Duration(
                                                milliseconds: (1000 + 5000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex1 = index,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 8.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: GridView(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.78,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_qwmev4k9_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context.pushNamed(
                                                PrabhupadaWidget.routeName);
                                          },
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Frame_1000sdf.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'l0ift6se' /* Prabhupada */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w600,
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_q04x6qfy_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context.pushNamed(
                                                AboutPageWidget.routeName);
                                          },
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/ABout.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'fumgcmqu' /* About */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w600,
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_exwbm0on_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context.pushNamed(
                                                BooksPageWidget.routeName);
                                          },
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/books.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '73i9jf4m' /* Books */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w600,
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_6vmn5zg4_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context.pushNamed(
                                                AudioCategoryPageWidget
                                                    .routeName);
                                          },
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/audio.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ie1p35tz' /* Audio */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w600,
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_ic53lbld_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context.pushNamed(
                                                VideosCategoryPageWidget
                                                    .routeName);
                                          },
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/videos.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'u4qi2f9m' /* Video */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w600,
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_2r26h9ib_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context.pushNamed(
                                                PhotosPageWidget.routeName);
                                          },
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/photots.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qf0jfmm3' /* Gallery */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w600,
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_m6qz3mht_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context.pushNamed(
                                                IskonBkkWidget.routeName);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/WhatsApp_Image_2024-08-03_at_12.55.00.jpeg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        FFLocalizations.of(context).getText(
                                                          'fc5nfn2l' /* ISKCON Bangkok */,
                                                        ),
                                                        textAlign: TextAlign.start,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).backGrey,
                                                          fontSize: MediaQuery.of(context).size.width < 400 ? 9.0 : 10.5,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ],
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
                                                'HOME_PAGE_PAGE_Container_awoqbrdb_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');
        
                                            context
                                                .pushNamed(NewsWidget.routeName);
                                          },
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/newsIcon.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'u6qtupa1' /* News */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                      FontWeight.w600,
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                    FontWeight.w600,
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
                                      ],
                                    ),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: FFAppState().homePageVideoAPI(
                                      requestFn: () =>
                                          LaravelGroup.postsListCall.call(
                                            token: FFAppState().Token,
                                            postTypeId: '7',
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .davysGray,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final containerPostsListResponse =
                                      snapshot.data!;
        
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'gcqfdw7o' /* Featured Videos */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      font:
                                                      GoogleFonts.poppins(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                      ),
                                                      color:
                                                      Color(0xFF4F4F4F),
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_PAGE_Text_wsib885t_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');
        
                                                      context.pushNamed(
                                                          FeaturedVideosWidget
                                                              .routeName);
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(context)
                                                          .getText(
                                                        'io6766fg' /* View All */,
                                                      ),
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        font: GoogleFonts
                                                            .poppins(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontStyle:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final featuredVid = LaravelGroup
                                                      .postsListCall
                                                      .dataList(
                                                    containerPostsListResponse
                                                        .jsonBody,
                                                  )
                                                      ?.where((e) =>
                                                  functions.jsonToint(
                                                      e,
                                                      'is_featured') ==
                                                      1)
                                                      .toList()
                                                      .toList() ??
                                                      [];
        
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 200.0,
                                                    child: CarouselSlider.builder(
                                                      itemCount:
                                                      featuredVid.length,
                                                      itemBuilder: (context,
                                                          featuredVidIndex, _) {
                                                        final featuredVidItem =
                                                        featuredVid[
                                                        featuredVidIndex];
                                                        return InkWell(
                                                          splashColor:
                                                          Colors.transparent,
                                                          focusColor:
                                                          Colors.transparent,
                                                          hoverColor:
                                                          Colors.transparent,
                                                          highlightColor:
                                                          Colors.transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_PAGE_Image_qh8iobyd_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Image_navigate_to');
        
                                                            context.pushNamed(
                                                              VideoPostWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'videoItem':
                                                                serializeParam(
                                                                  featuredVidItem,
                                                                  ParamType.JSON,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8.0),
                                                            child: Image.network(
                                                              getJsonField(
                                                                featuredVidItem,
                                                                r'''$.image''',
                                                              ).toString(),
                                                              width:
                                                              double.infinity,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                                  Image.asset(
                                                                    'assets/images/error_image.png',
                                                                    width: double
                                                                        .infinity,
                                                                    height: 200.0,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      carouselController: _model
                                                          .carouselController2 ??=
                                                          CarouselSliderController(),
                                                      options: CarouselOptions(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                1,
                                                                featuredVid
                                                                    .length -
                                                                    1)),
                                                        viewportFraction: 1.0,
                                                        disableCenter: true,
                                                        enlargeCenterPage: true,
                                                        enlargeFactor: 0.25,
                                                        enableInfiniteScroll:
                                                        true,
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        autoPlay: true,
                                                        autoPlayAnimationDuration:
                                                        Duration(
                                                            milliseconds:
                                                            1000),
                                                        autoPlayInterval:
                                                        Duration(
                                                            milliseconds:
                                                            (1000 +
                                                                5000)),
                                                        autoPlayCurve:
                                                        Curves.linear,
                                                        pauseAutoPlayInFiniteScroll:
                                                        true,
                                                        onPageChanged: (index,
                                                            _) =>
                                                        _model.carouselCurrentIndex2 =
                                                            index,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.bottomNavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BottomNavBarWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
