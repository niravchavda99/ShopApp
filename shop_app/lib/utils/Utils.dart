import 'package:flutter/material.dart';

class Utils {
  static List<Color> _colors = [
    Colors.red,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.orange,
    Colors.yellow,
    Colors.lime,
    Colors.pink,
    Colors.teal,
  ];

  static List<Color> getColors(int count) {
    return _colors.getRange(0, count).toList()..shuffle();
  }
}
