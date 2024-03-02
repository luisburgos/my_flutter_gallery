import 'package:flutter/material.dart';

Color hexToColor(String code) {
  var hexColor = code.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }
  return Color(int.parse(hexColor, radix: 16));
}
