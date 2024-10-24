import 'package:flutter/material.dart';

class EasyShortcutsState extends InheritedWidget {
  const EasyShortcutsState({
    required this.shortcutsFocusNode,
    required super.child,
    super.key,
  });

  final FocusNode shortcutsFocusNode;

  static EasyShortcutsState of(BuildContext context) {
    final state =
        context.dependOnInheritedWidgetOfExactType<EasyShortcutsState>();
    if (state == null) {
      throw Exception('GlobalShortcuts not found in the widget tree');
    }
    return state;
  }

  @override
  bool updateShouldNotify(EasyShortcutsState oldWidget) {
    return oldWidget.shortcutsFocusNode.hasFocus != shortcutsFocusNode.hasFocus;
  }
}
