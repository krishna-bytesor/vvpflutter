import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _flutterFamily = 'Flutter';
  static const String _fluttermenuFamily = 'Fluttermenu';

  // MyFlutterApp
  static const IconData kbook =
      IconData(0xe828, fontFamily: _myFlutterAppFamily);

  // Flutter
  static const IconData kplay = IconData(0xe800, fontFamily: _flutterFamily);

  // Fluttermenu
  static const IconData khandHoldingHeart =
      IconData(0xf4be, fontFamily: _fluttermenuFamily);
}
