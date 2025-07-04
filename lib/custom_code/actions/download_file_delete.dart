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
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

Future<bool> downloadFileDelete(dynamic post) async {
  final url = post['data'];
  final id = post['id'];
  final extension = path.extension(url);
  final title = 'file${id}$extension';

  final directory = await getApplicationDocumentsDirectory();
  final file = File(path.join(directory.path, title));

  if (await file.exists()) {
    try {
      await file.delete();
      print('File deleted: ${file.path}');
      return true;
    } catch (e) {
      print('Error deleting file: $e');
      return false;
    }
  } else {
    print('File does not exist: ${file.path}');
    return false;
  }
}
