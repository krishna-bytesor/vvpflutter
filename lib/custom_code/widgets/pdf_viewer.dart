// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({
    super.key,
    this.width,
    this.height,
    this.postId,
    required this.url,
  });

  final double? width;
  final double? height;
  final String url;
  final int? postId;

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late PdfViewerController _pdfViewerController;
  late File downloadedFile;
  bool downloaded = false;
  String progress = '0';
  String fileName = '';
  String filePath = '';
  bool hasLocalFile = false;
  int _lastPageNumber = 1;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    fileName = 'file${widget.postId}.pdf';
    createFilePath();
    _loadLastPageNumber();
  }

  Future<void> _loadLastPageNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastPageNumber = prefs.getInt('lastPage_${widget.postId}') ?? 1;
    });
    _pdfViewerController.jumpToPage(_lastPageNumber);
    _pdfViewerController.jumpToPage(_lastPageNumber);
  }

  Future<void> _saveLastPageNumber(int pageNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastPage_${widget.postId}', pageNumber);
  }

  createFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    filePath = '${directory.path}/$fileName';
    downloadedFile = File(filePath);
    hasLocalFile = await downloadedFile.exists();
    setState(() {});
    if (!hasLocalFile) {
      download2();
    } else {
      downloaded = true;
    }
  }

  Future download2() async {
    var dio = Dio();
    try {
      Response response = await dio.get(
        widget.url,
        onReceiveProgress: showDownloadProgress,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      File file = File(filePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      downloadedFile = file;
      setState(() {
        downloaded = true;
      });
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      setState(() {
        progress = '${(received / total * 100).toStringAsFixed(0)}%';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return downloaded
        ? SfPdfViewer.file(
            File(downloadedFile.path),
            key: _pdfViewerKey,
            scrollDirection: PdfScrollDirection.vertical,
            canShowPaginationDialog: true,
            canShowPageLoadingIndicator: true,
            canShowScrollStatus: true,
            canShowScrollHead: true,
            controller: _pdfViewerController,
            onPageChanged: (PdfPageChangedDetails details) {
              _saveLastPageNumber(details.newPageNumber);
            },
            // initialScrollOffset: Offset(
            //     0, (_lastPageNumber - 1) * 792), // Assuming default page height
          )
        : Center(
            child: Text(
              'Loading PDF $progress',
              style: TextStyle(fontSize: 20),
            ),
          );
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }
}
