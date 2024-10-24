import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

bool isSmallWidth(BuildContext context) {
  return context.breakpoint <= ShadTheme.of(context).breakpoints.sm;
}
