import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'photo_album_model.dart';
export 'photo_album_model.dart';

class PhotoAlbumWidget extends StatefulWidget {
  const PhotoAlbumWidget({
    super.key,
    required this.postList,
    required this.title,
  });

  final List<dynamic>? postList;
  final String? title;

  static String routeName = 'PhotoAlbum';
  static String routePath = '/photoalbum';

  @override
  State<PhotoAlbumWidget> createState() => _PhotoAlbumWidgetState();
}

class _PhotoAlbumWidgetState extends State<PhotoAlbumWidget> {
  late PhotoAlbumModel _model;
  static const String s3BaseUrl =
      'https://vvpswamiv2.s3.ap-southeast-2.amazonaws.com';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoAlbumModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PhotoAlbum'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  String getFullUrl(dynamic item, String field) {
    final relativePath = getJsonField(item, field)?.toString();
    if (relativePath == null || relativePath.isEmpty) {
      return '';
    }

    if (relativePath.startsWith('http://') ||
        relativePath.startsWith('https://')) {
      return relativePath;
    }

    final cleanPath =
        relativePath.startsWith('/') ? relativePath.substring(1) : relativePath;

    return '$s3BaseUrl/$cleanPath';
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
            backgroundColor: FlutterFlowTheme.of(context).oldLace,
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
                                'PHOTO_ALBUM_PAGE_chevron_left_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        Flexible(
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget.title,
                              'Title',
                            ),
                            textAlign: TextAlign.center,
                            minFontSize: 12.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                        Container(
                          width: 60.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PHOTO_ALBUM_PAGE_Icon_xvsfs2vk_ON_TAP');
                              logFirebaseEvent('Icon_action_block');
                              final currentItem = widget.postList
                                  ?.elementAtOrNull(
                                      _model.pageViewCurrentIndex);
                              if (currentItem != null) {
                                await action_blocks.downloadFile(
                                  context,
                                  fileJson: {
                                    'data': getJsonField(
                                        currentItem, r'''$.image'''),
                                    'id': getJsonField(
                                            currentItem, r'''$.id''') ??
                                        _model.pageViewCurrentIndex,
                                    'post_type_id': 6,
                                    'title': getJsonField(
                                            currentItem, r'''$.title''') ??
                                        widget.title ??
                                        'Photo',
                                  },
                                );
                              }
                              logFirebaseEvent('Icon_launch_u_r_l');
                              await launchURL(getJsonField(
                                widget.postList!.elementAtOrNull(
                                    _model.pageViewCurrentIndex),
                                r'''$.image''',
                              ).toString());
                            },
                            child: Icon(
                              Icons.file_download_outlined,
                              color: FlutterFlowTheme.of(context).backGrey,
                              size: 32.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 16.0),
                              child: Builder(
                                builder: (context) {
                                  final image =
                                      widget.postList!.map((e) => e).toList();

                                  return Container(
                                    width: 345.0,
                                    height: 588.0,
                                    child: PageView.builder(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(
                                                  0, min(0, image.length - 1))),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: image.length,
                                      itemBuilder: (context, imageIndex) {
                                        final imageItem = image[imageIndex];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            getFullUrl(
                                              imageItem,
                                              r'''$.image''',
                                            ),
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.contain,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final rowImages =
                                      widget.postList!.map((e) => e).toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(rowImages.length,
                                          (rowImagesIndex) {
                                        final rowImagesItem =
                                            rowImages[rowImagesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PHOTO_ALBUM_PAGE_Image_vo7rz2fj_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_update_page_state');
                                            _model.index = rowImagesIndex;
                                            logFirebaseEvent('Image_page_view');
                                            await _model.pageViewController
                                                ?.animateToPage(
                                              _model.index,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              getFullUrl(
                                                rowImagesItem,
                                                r'''$.image''',
                                              ),
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      }).divide(SizedBox(width: 8.0)),
                                    ),
                                  );
                                },
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
          ),
        ));
  }
}
