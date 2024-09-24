import 'package:flutter/material.dart';

class SiteTopBarState extends InheritedWidget {
  const SiteTopBarState({
    required this.selectedIndex,
    required this.setIndex,
    required super.child,
    super.key,
  });

  final int selectedIndex;
  final void Function(int, VoidCallback) setIndex;

  static SiteTopBarState of(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<SiteTopBarState>();
    if (state == null) {
      throw Exception('SiteTopBar not found in the widget tree');
    }
    return state;
  }

  @override
  bool updateShouldNotify(SiteTopBarState oldWidget) {
    return oldWidget.selectedIndex != selectedIndex;
  }
}
