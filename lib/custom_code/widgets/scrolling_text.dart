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

import 'package:marquee/marquee.dart';

class ScrollingText extends StatefulWidget {
  const ScrollingText({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.fontSize = 16.0,
    this.textColor = Colors.black,
  });

  final double? width;
  final double? height;
  final String text;
  final double? fontSize;
  final Color? textColor;

  @override
  State<ScrollingText> createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.fontSize! + 10,
      width: widget.width,
      child: Marquee(
        text: widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.textColor,
          fontWeight: FontWeight.w700,
        ),
        scrollAxis: Axis.horizontal,
        blankSpace: MediaQuery.of(context).size.width,
        velocity: 50.0,
        pauseAfterRound: Duration(seconds: 1),
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        decelerationDuration: Duration(milliseconds: 500),
      ),
    );
  }
}
