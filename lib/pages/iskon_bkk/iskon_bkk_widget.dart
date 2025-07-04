import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/backend/api_requests/api_calls.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'iskon_bkk_model.dart';
export 'iskon_bkk_model.dart';

class IskonBkkWidget extends StatefulWidget {
  const IskonBkkWidget({super.key});

  static String routeName = 'IskonBkk';
  static String routePath = '/iskonBkk';

  @override
  State<IskonBkkWidget> createState() => _IskonBkkWidgetState();
}

class _IskonBkkWidgetState extends State<IskonBkkWidget>
    with TickerProviderStateMixin {
  late IskonBkkModel _model;
  String? _youtubeUrl;
  bool _isLoadingYoutubeUrl = true;
  String? _youtubeError;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IskonBkkModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'IskonBkk'});

    // Fetch project data on initialization
    _fetchProjectData();
    _fetchYoutubeUrl();
  }

  Future<void> _fetchProjectData() async {
    setState(() {
      _model.isLoadingProjects = true;
    });

    try {
      final response = await LaravelGroup.projectCall.call();
      if (response.succeeded) {
        final data = response.jsonBody;
        if (data != null && data['data'] != null) {
          final projectList = data['data'] as List<dynamic>;
          setState(() {
            _model.projectData = projectList;
            if (projectList.isNotEmpty) {
              _model.tabBarController?.dispose();
              _model.tabBarController = TabController(
                vsync: this,
                length: projectList.length,
                initialIndex: 0,
              )..addListener(() => safeSetState(() {}));
            }
          });
        }
      }
    } catch (e) {
      print('Error fetching project data: $e');
    }

    if (mounted) {
      setState(() {
        _model.isLoadingProjects = false;
      });
    }
  }

  Future<void> _fetchYoutubeUrl() async {
    setState(() {
      _isLoadingYoutubeUrl = true;
      _youtubeError = null;
    });
    try {
      final response = await VVPAPIsGroup.youtubeUrlsCall.call();
      if (response.succeeded) {
        final url = VVPAPIsGroup.youtubeUrlsCall.firstUrl(response.jsonBody);
        setState(() {
          _youtubeUrl = url;
          _isLoadingYoutubeUrl = false;
        });
      } else {
        setState(() {
          _youtubeError = 'Failed to load YouTube URL';
          _isLoadingYoutubeUrl = false;
        });
      }
    } catch (e) {
      setState(() {
        _youtubeError = 'Error: \\${e.toString()}';
        _isLoadingYoutubeUrl = false;
      });
    }
  }

  Future<String> _loadTextFile(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String content = response.body;

        // Handle HTML entities first
        content = content
            .replaceAll('&amp;', '&')
            .replaceAll('&lt;', '<')
            .replaceAll('&gt;', '>')
            .replaceAll('&quot;', '"')
            .replaceAll('&#39;', "'")
            .replaceAll('&nbsp;', ' ')
            .replaceAll('&ndash;', '–')
            .replaceAll('&mdash;', '—')
            .replaceAll('&hellip;', '...')
            .replaceAll('&ldquo;', '"')
            .replaceAll('&rdquo;', '"')
            .replaceAll('&lsquo;', ''')
            .replaceAll('&rsquo;', ''')
            .replaceAll('&copy;', '©')
            .replaceAll('&reg;', '®')
            .replaceAll('&trade;', '™');

        // Handle specific HTML tags properly
        content = content
            .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false),
                '\n') // Convert <br> to newline
            .replaceAll(RegExp(r'<br\s+/>', caseSensitive: false),
                '\n') // Convert <br/> to newline
            .replaceAll(RegExp(r'<p\s*[^>]*>', caseSensitive: false),
                '') // Remove opening <p> tags
            .replaceAll(RegExp(r'</p>', caseSensitive: false),
                '\n\n') // Convert closing </p> to double newline
            .replaceAll(RegExp(r'<strong\s*[^>]*>', caseSensitive: false),
                '**') // Convert <strong> to markdown bold
            .replaceAll(RegExp(r'</strong>', caseSensitive: false),
                '**') // Convert </strong> to markdown bold
            .replaceAll(RegExp(r'<b\s*[^>]*>', caseSensitive: false),
                '**') // Convert <b> to markdown bold
            .replaceAll(RegExp(r'</b>', caseSensitive: false),
                '**') // Convert </b> to markdown bold
            .replaceAll(RegExp(r'<em\s*[^>]*>', caseSensitive: false),
                '*') // Convert <em> to markdown italic
            .replaceAll(RegExp(r'</em>', caseSensitive: false),
                '*') // Convert </em> to markdown italic
            .replaceAll(RegExp(r'<i\s*[^>]*>', caseSensitive: false),
                '*') // Convert <i> to markdown italic
            .replaceAll(RegExp(r'</i>', caseSensitive: false),
                '*') // Convert </i> to markdown italic
            .replaceAll(RegExp(r'<li\s*[^>]*>', caseSensitive: false),
                '• ') // Convert <li> to bullet point
            .replaceAll(RegExp(r'</li>', caseSensitive: false),
                '\n') // Convert </li> to newline
            .replaceAll(RegExp(r'<ul\s*[^>]*>', caseSensitive: false),
                '') // Remove <ul> tags
            .replaceAll(RegExp(r'</ul>', caseSensitive: false),
                '\n') // Convert </ul> to newline
            .replaceAll(RegExp(r'<ol\s*[^>]*>', caseSensitive: false),
                '') // Remove <ol> tags
            .replaceAll(RegExp(r'</ol>', caseSensitive: false),
                '\n') // Convert </ol> to newline
            .replaceAll(RegExp(r'<h[1-6]\s*[^>]*>', caseSensitive: false),
                '\n') // Convert headers to newline
            .replaceAll(RegExp(r'</h[1-6]>', caseSensitive: false),
                '\n') // Convert closing headers to newline
            .replaceAll(RegExp(r'<div\s*[^>]*>', caseSensitive: false),
                '') // Remove <div> tags
            .replaceAll(RegExp(r'</div>', caseSensitive: false),
                '\n') // Convert </div> to newline
            .replaceAll(RegExp(r'<span\s*[^>]*>', caseSensitive: false),
                '') // Remove <span> tags
            .replaceAll(RegExp(r'</span>', caseSensitive: false),
                '') // Remove </span> tags
            .replaceAll(RegExp(r'<a\s*[^>]*>', caseSensitive: false),
                '') // Remove <a> tags
            .replaceAll(
                RegExp(r'</a>', caseSensitive: false), '') // Remove </a> tags
            .replaceAll(RegExp(r'<img\s*[^>]*>', caseSensitive: false),
                '') // Remove <img> tags
            .replaceAll(RegExp(r'<table\s*[^>]*>', caseSensitive: false),
                '') // Remove <table> tags
            .replaceAll(RegExp(r'</table>', caseSensitive: false),
                '\n') // Convert </table> to newline
            .replaceAll(RegExp(r'<tr\s*[^>]*>', caseSensitive: false),
                '') // Remove <tr> tags
            .replaceAll(RegExp(r'</tr>', caseSensitive: false),
                '\n') // Convert </tr> to newline
            .replaceAll(RegExp(r'<td\s*[^>]*>', caseSensitive: false),
                '') // Remove <td> tags
            .replaceAll(RegExp(r'</td>', caseSensitive: false),
                ' ') // Convert </td> to space
            .replaceAll(RegExp(r'<th\s*[^>]*>', caseSensitive: false),
                '') // Remove <th> tags
            .replaceAll(RegExp(r'</th>', caseSensitive: false),
                ' ') // Convert </th> to space
            .replaceAll(RegExp(r'<blockquote\s*[^>]*>', caseSensitive: false),
                '> ') // Convert <blockquote> to quote
            .replaceAll(RegExp(r'</blockquote>', caseSensitive: false),
                '\n') // Convert </blockquote> to newline
            .replaceAll(RegExp(r'<code\s*[^>]*>', caseSensitive: false),
                '`') // Convert <code> to backtick
            .replaceAll(RegExp(r'</code>', caseSensitive: false),
                '`') // Convert </code> to backtick
            .replaceAll(RegExp(r'<pre\s*[^>]*>', caseSensitive: false),
                '```\n') // Convert <pre> to code block
            .replaceAll(RegExp(r'</pre>', caseSensitive: false),
                '\n```') // Convert </pre> to code block
            .replaceAll(RegExp(r'<hr\s*[^>]*>', caseSensitive: false),
                '\n---\n') // Convert <hr> to horizontal rule
            .replaceAll(RegExp(r'<sup\s*[^>]*>', caseSensitive: false),
                '^') // Convert <sup> to superscript
            .replaceAll(
                RegExp(r'</sup>', caseSensitive: false), '') // Remove </sup>
            .replaceAll(RegExp(r'<sub\s*[^>]*>', caseSensitive: false),
                '_') // Convert <sub> to subscript
            .replaceAll(
                RegExp(r'</sub>', caseSensitive: false), ''); // Remove </sub>

        // Remove any remaining HTML tags
        content = content.replaceAll(RegExp(r'<[^>]*>'), '');

        // Clean up whitespace and normalize line breaks
        content = content
            .replaceAll(
                RegExp(r'\n\s*\n\s*\n'), '\n\n') // Remove excessive line breaks
            .replaceAll(RegExp(r'[ \t]+'),
                ' ') // Replace multiple spaces/tabs with single space
            .trim(); // Remove leading/trailing whitespace

        // Handle special characters and formatting
        content = content
            .replaceAll('\\n', '\n') // Handle escaped newlines
            .replaceAll('\\t', '\t') // Handle escaped tabs
            .replaceAll('\\r', '\r'); // Handle escaped carriage returns

        return content;
      } else {
        throw Exception(
            'Failed to load text file: HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading text file: $e');
      return 'Error loading content: ${e.toString()}';
    }
  }

  List<TextSpan> _parseMarkdownText(String text) {
    List<TextSpan> spans = [];
    String remainingText = text;

    while (remainingText.isNotEmpty) {
      // Find the next markdown pattern
      int boldStart = remainingText.indexOf('**');
      int italicStart = remainingText.indexOf('*');

      // If no markdown patterns found, add remaining text as normal
      if (boldStart == -1 && italicStart == -1) {
        spans.add(TextSpan(text: remainingText));
        break;
      }

      // Determine which pattern comes first
      int firstPattern = -1;
      String pattern = '';
      if (boldStart != -1 && (italicStart == -1 || boldStart < italicStart)) {
        firstPattern = boldStart;
        pattern = '**';
      } else {
        firstPattern = italicStart;
        pattern = '*';
      }

      // Add text before the pattern
      if (firstPattern > 0) {
        spans.add(TextSpan(text: remainingText.substring(0, firstPattern)));
      }

      // Find the closing pattern
      int closingPattern =
          remainingText.indexOf(pattern, firstPattern + pattern.length);
      if (closingPattern == -1) {
        // No closing pattern found, treat as normal text
        spans.add(TextSpan(text: remainingText.substring(firstPattern)));
        break;
      }

      // Extract the formatted text
      String formattedText = remainingText.substring(
          firstPattern + pattern.length, closingPattern);

      // Add formatted text with appropriate style
      if (pattern == '**') {
        spans.add(TextSpan(
          text: formattedText,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
                color: Color(0xFF232323),
                fontSize: 14.0,
                lineHeight: 1.6,
              ),
        ));
      } else if (pattern == '*') {
        spans.add(TextSpan(
          text: formattedText,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
                color: Color(0xFF232323),
                fontSize: 14.0,
                lineHeight: 1.6,
              ),
        ));
      }

      // Update remaining text
      remainingText = remainingText.substring(closingPattern + pattern.length);
    }

    return spans;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
        child: GestureDetector(
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
                              'ISKON_BKK_PAGE_chevron_left_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.pop();
                        },
                      ),
                      AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'qw893cg8' /* Projects */,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 15.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'ISKON_BKK_PAGE_Icon_16h862ik_ON_TAP');
                            logFirebaseEvent('Icon_launch_u_r_l');
                            unawaited(
                              () async {
                                await launchURL(
                                    'http://www.vvpswami.com/wp-content/uploads/2024/07/2024-05-ISKCON-Vedic-Centre-1.pdf');
                              }(),
                            );
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
                  if (_isLoadingYoutubeUrl)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    )
                  else if (_youtubeError != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                        child: Text(
                          _youtubeError!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  else if (_youtubeUrl != null && _youtubeUrl!.isNotEmpty)
                    FlutterFlowYoutubePlayer(
                      url: _youtubeUrl!,
                      autoPlay: false,
                      looping: true,
                      mute: false,
                      showControls: true,
                      showFullScreen: true,
                      strictRelatedVideos: true,
                    ),
                  Flexible(
                    child: _model.tabBarController == null
                        ? Center(
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          )
                        : Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  indicatorWeight: 1.0,
                                  padding: EdgeInsets.all(4.0),
                                  tabs: _model.projectData!.map((project) {
                                    final title = project['title'] as String? ??
                                        'Untitled';
                                    return Tab(
                                      text: title,
                                    );
                                  }).toList(),
                                  controller: _model.tabBarController,
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: _model.projectData!.map((project) {
                                    final title = project['title'] as String? ??
                                        'Untitled';
                                    final imageUrls =
                                        (project['images'] as List<dynamic>?)
                                                ?.map((url) => url.toString())
                                                .toList() ??
                                            [];

                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 15.0, 12.0, 20.0),
                                      child: imageUrls.isNotEmpty
                                          ? SingleChildScrollView(
                                              child: Column(
                                                children: imageUrls.map((url) {
                                                  // Check if the URL is a text file
                                                  if (url
                                                      .toLowerCase()
                                                      .endsWith('.txt')) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 16.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        decoration:
                                                            BoxDecoration(
                                                              color: Colors.transparent,
                                                          borderRadius:
                                                               BorderRadius
                                                                  .circular(
                                                                      8.0),

                                                        ),
                                                        child: FutureBuilder<
                                                            String>(
                                                          future: _loadTextFile(
                                                              url),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              );
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .error_outline,
                                                                      color: Colors
                                                                          .red,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            8.0),
                                                                    Text(
                                                                      'Error loading content',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            4.0),
                                                                    Text(
                                                                      'Please try again later or contact support.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            } else {
                                                              final content =
                                                                  snapshot.data ??
                                                                      'No content available';

                                                              // Check if content is empty or just whitespace
                                                              if (content
                                                                  .trim()
                                                                  .isEmpty) {
                                                                return Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .info_outline,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              8.0),
                                                                      Text(
                                                                        'No content available',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }

                                                              return SelectableText
                                                                  .rich(
                                                                TextSpan(
                                                                  children:
                                                                      _parseMarkdownText(
                                                                          content),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF232323),
                                                                      fontSize:
                                                                          14.0,
                                                                      lineHeight:
                                                                          1.6,
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    // Handle as image file
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 16.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image: Image
                                                                    .network(
                                                                  url,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  loadingBuilder:
                                                                      (context,
                                                                          child,
                                                                          loadingProgress) {
                                                                    if (loadingProgress ==
                                                                        null)
                                                                      return child;
                                                                    return Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        value: loadingProgress.expectedTotalBytes !=
                                                                                null
                                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                                                loadingProgress.expectedTotalBytes!
                                                                            : null,
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag:
                                                                    'projectImage_$url',
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag:
                                                              'projectImage_$url',
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              url,
                                                              width: double
                                                                  .infinity,
                                                              fit: BoxFit
                                                                  .contain,
                                                              loadingBuilder:
                                                                  (context,
                                                                      child,
                                                                      loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null)
                                                                  return child;
                                                                return Container(
                                                                  height: 400,
                                                                  child: Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      value: loadingProgress.expectedTotalBytes !=
                                                                              null
                                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                                              loadingProgress.expectedTotalBytes!
                                                                          : null,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                }).toList(),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                                'No images available for $title',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCF6E5),
                      border: Border.all(
                        color: Color(0xFFBEE3E1),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ISKON_BKK_PAGE_Container_cch64jz7_ON_TAP');
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(PledgePageWidget.routeName);
                        },
                        child: Container(
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
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '59yf7bzh' /* Enquire */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF232323),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
