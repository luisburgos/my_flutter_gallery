import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width <= 640;
}
