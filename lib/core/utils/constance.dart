import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(0, 197, 105, 1);
const blackColor = Colors.black;
const errorColor = Colors.red;
const String idToken = "UId";
extension ColorExtension on String {
  toColor() {
    var hexStringColor = this;
    final buffer = StringBuffer();

    if (hexStringColor.length == 6 || hexStringColor.length == 7) {
      buffer.write('ff');
      buffer.write(hexStringColor.replaceFirst("#", ""));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
  }
}
