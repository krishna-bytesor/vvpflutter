// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

var httpClient = new HttpClient();

Future<bool> downloadFile(dynamic post) async {
  // download post and save it with post title in application documents directory
  final url = post['data'];
  // final title = post['title'] + '.mp3';
  String extension = path.extension(post['data']);
  print(post);
  String title = 'file' + post['id'].toString() + extension;
  final directory = await getApplicationDocumentsDirectory();

  final file = File('${directory.path}/${title}');
  bool hasLocalFile = await file.exists();

  if (hasLocalFile) {
    return true;
  }
  // download post data as file and store in application document directory
// Get the application document directory
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);

  // Create a file with the post ID as the file name

  // Write the post data to the file
  await file.writeAsBytes(bytes);
  print(file.path);
  // Return the file path
  return await file.exists();
}
