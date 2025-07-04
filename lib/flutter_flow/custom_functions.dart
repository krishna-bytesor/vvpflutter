import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? stringToDate(String? date) {
  if (date == null || date == 'null') {
    return null;
  }
  // covert string to date
  return DateTime.parse(date);
}

int? getDropdownIndex(
  dynamic value,
  List<dynamic> data,
) {
  // Find the index of the matching value in the data list
  for (int i = 0; i < data.length; i++) {
    if (data[i].toString() == value.toString()) {
      return i; // Return the index if a match is found
    }
  }

  return null;
}

dynamic stringTOJson(String? stringText) {
  dynamic jsonString = {"message": stringText};

  return jsonString['message'];
}

int? getDropdownIdInt(
  int? value,
  List<dynamic>? data,
  String? keyNameGiven,
) {
  String key = keyNameGiven ?? 'name';
  try {
    if (value != null && (data != null)) {
      final int? id = (data.firstWhere((e) => e[key] == value)['id']);
      print("ID is $id");
      return id;
    }
  } catch (e) {
    return null;
  }

  return null;
}

bool isFavourite(
  int id,
  List<dynamic> listData,
) {
  for (var element in listData) {
    if (element['id'] == id) {
      return true;
    }
  }
  return false;
}

DateTime stringToDateddMMyyyy(
  String dateString,
  String test,
) {
  // Define the date format
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  // covert string to date
  return dateFormat.parse(dateString);
}

List<dynamic> listjsontoListJsonfromApi(List<dynamic> jsonObject) {
  // jsonobject to list json
  return jsonObject;
}

List<dynamic> getMultipleDropdownItems(
  List<dynamic> playlists,
  int audioId,
) {
  return playlists.where((playlist) {
    List<dynamic> audioList = playlist['audio'] ?? [];
    return audioList.contains(audioId);
  }).toList();
}

List<dynamic> jsontoListJson(dynamic jsonObject) {
  // jsonobject to list json
  return [jsonObject];
}

String multiLinesToSingle(String text) {
  // Multi lines to single line
  return text.replaceAll('\n', '');
}

int? getDropdownId(
  String? value,
  List<dynamic>? data,
  String? keyNameGiven,
) {
  String key = keyNameGiven ?? 'name';
  try {
    if (value != null && (data != null)) {
      final int? id = (data.firstWhere((e) => e[key] == value)['id']);
      print("ID is $id");
      return id;
    }
  } catch (e) {
    return null;
  }

  return null;
}

bool validateEmail(String email) {
  // Check if the email is empty
  if (email.isEmpty) {
    return false;
  }

  // Regular expression to validate email addresses
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

  // Check if the email matches the regular expression
  return emailRegex.hasMatch(email);
}

int jsonToint(
  dynamic json,
  String key,
) {
  dynamic value = json[key];

  // Handle boolean values
  if (value is bool) {
    return value ? 1 : 0;
  }

  // Handle string values that might be "1" or "0"
  if (value is String) {
    if (value.toLowerCase() == 'true' || value == '1') {
      return 1;
    } else if (value.toLowerCase() == 'false' || value == '0') {
      return 0;
    }
  }

  // Handle null values
  if (value == null) {
    return 0;
  }

  // Try to convert to int, fallback to 0 if conversion fails
  try {
    return int.parse(value.toString());
  } catch (e) {
    return 0;
  }
}

dynamic mobileNumberCode(String mobileNumber) {
  // Define a list of possible country codes
  List<String> countryCodes = ['+91', '+61', '+64', '+1'];

  // Loop through the list of country codes to find a match
  for (String code in countryCodes) {
    if (mobileNumber.startsWith(code)) {
      // Separate the country code and the rest of the number
      String numberWithoutCode = mobileNumber.substring(code.length);
      return {
        'countryCode': code,
        'number': numberWithoutCode,
      };
    }
  }

  // If no country code is found, return the number as is
  return {
    'countryCode': '',
    'number': mobileNumber,
  };
}

List<String>? filterUncheckList(
  List<String> list,
  List<String>? checkedList,
) {
  // filter list by removing checkList
  if (checkedList == null || checkedList.isEmpty) {
    return list;
  }
  return list.where((item) => !checkedList.contains(item)).toList();
}

String combineTextFromJson(
  String? part,
  String? chapter,
) {
  // combine the provided part and chapter
  return (part != null && part != 'null') &&
          (chapter != null && chapter != 'null')
      ? '$part $chapter'
      : 'null';
}

dynamic parseStringto2stringJson(String input) {
  // Split the string by spaces
  List<String> parts = input.split(' ');

  // Ensure there are at least two parts to extract
  if (parts.length < 2) {
    // Handle error or return an empty map if input is incorrect
    return {'part': '', 'chapter': ''};
  }

  // Extract the part and chapter based on assumed structure
  String part = parts[0]; // e.g., 'SB'
  String chapter = parts
      .sublist(1)
      .join('.'); // Combines remaining parts as chapter, e.g., '9.2.12'

  // Return as a JSON map
  return {
    'part': part,
    'chapter': chapter,
  };
}

String stripHtmlTags(String htmlText) {
  // Remove HTML tags using regex
  return htmlText.replaceAll(RegExp(r'<[^>]*>'), '');
}

String cleanHtmlContent(String? htmlContent) {
  if (htmlContent == null || htmlContent.isEmpty) {
    return '';
  }

  // Remove any script tags and their content
  htmlContent = htmlContent.replaceAll(
      RegExp(r'<script[^>]*>.*?</script>', dotAll: true), '');

  // Remove any style tags and their content
  htmlContent = htmlContent.replaceAll(
      RegExp(r'<style[^>]*>.*?</style>', dotAll: true), '');

  // Clean up any malformed HTML
  htmlContent = htmlContent.replaceAll(RegExp(r'<[^>]*$'), '');

  return htmlContent;
}
