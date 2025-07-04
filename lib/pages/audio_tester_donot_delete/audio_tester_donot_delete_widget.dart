import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audio_tester_donot_delete_model.dart';
import 'package:v_v_p_swami/audio_helpers/player_invoke.dart';
import 'package:v_v_p_swami/audio_helpers/main_player/main_player.dart';
import 'package:v_v_p_swami/audio_helpers/mediaitem_converter.dart';
export 'audio_tester_donot_delete_model.dart';

class AudioTesterDonotDeleteWidget extends StatefulWidget {
  const AudioTesterDonotDeleteWidget({super.key});

  static String routeName = 'AudioTesterDonotDelete';
  static String routePath = '/audioTesterDonotDelete';

  @override
  State<AudioTesterDonotDeleteWidget> createState() =>
      _AudioTesterDonotDeleteWidgetState();
}

class _AudioTesterDonotDeleteWidgetState
    extends State<AudioTesterDonotDeleteWidget> {
  late AudioTesterDonotDeleteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioTesterDonotDeleteModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AudioTesterDonotDelete'});

    // Prefetch YouTube audio URLs in the background
    final audioUrl =
        'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3';
    if (audioUrl.contains('youtube.com') || audioUrl.contains('youtu.be')) {
      getYouTubeAudioStreamUrl(audioUrl);
    }
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).oldLace,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).backGrey,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('AUDIO_TESTER_DONOT_DELETE_chevron_left_I');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'yglweda3' /* Page Title */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1, // Only the first audio as an example
                          itemBuilder: (context, index) {
                            final audioUrl =
                                'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3';
                            final song = {
                              'id': '1',
                              'title': 'Class 2 Sri Caitanya Caritamrta',
                              'artist': 'Unknown',
                              'album': 'Test Album',
                              'genre': 'Spiritual',
                              'image': '',
                              'url': audioUrl,
                              'user_id': '1',
                              'user_name': 'Test',
                              'extra': {
                                'json': {},
                                'date': DateTime.now().toString(),
                                'country': '',
                                'city': '',
                              },
                            };
                            return ListTile(
                              leading: Icon(Icons.music_note),
                              title: Text(song['title']?.toString() ?? ''),
                              trailing: FutureBuilder<String?>(
                                future: (audioUrl.contains('youtube.com') ||
                                        audioUrl.contains('youtu.be'))
                                     ? getYouTubeAudioStreamUrl(audioUrl)
                                    : Future.value(audioUrl),
                                builder: (context, snapshot) {
                                   final isLoading =
                                      (audioUrl.contains('youtube.com') ||
                                               audioUrl.contains('youtu.be')) &&
                                           !snapshot.hasData;
                                    return IconButton(
                                     icon: isLoading
                                        ? SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(
                                                strokeWidth: 2))
                                        : Icon(Icons.play_arrow),
                                    onPressed: isLoading
                                        ? null
                                        : () async {
                                            await PlayerInvoke.init(
                                                songsList: [song], index: 0);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainPlayerView(),
                                              ),
                                            );
                                          },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-69798cbe',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-3d97e984',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-6a9f6489',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-d187898e',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-6b02ccbb',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-e98c96eb',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-02716c71',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-5a983000',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-43f0cda7',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://vvp-media.s3.ap-southeast-2.amazonaws.com/audios/Class2SriCaitanyaCaritamrta.mp3',
                            metas: Metas(
                              id: 'Class2SriCaitanyaCaritamrta.mp3-3a689253',
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
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 4.0,
                          pauseOnNavigate: false,
                          playInBackground: PlayInBackground.enabled,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'gkeb6wgg' /* UP Next */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'z5ihmto0' /* Shloka */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'm5fidvvw' /* Transcript */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xB5EFDBB6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
