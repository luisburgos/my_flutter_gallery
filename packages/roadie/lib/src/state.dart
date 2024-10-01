import 'package:flutter/material.dart';
import 'package:roadie/roadie.dart';

/// @no-doc
class RoadieAppState extends InheritedWidget {
  /// @no-doc
  const RoadieAppState({
    required this.roadmap,
    required this.markAsDone,
    required super.child,
    super.key,
  });

  /// @no-doc
  final Roadmap roadmap;

  /// @no-doc
  final void Function(
    String moduleName,
    String lessonName,
    VoidCallback onChanged,
  ) markAsDone;

  /// @no-doc
  static RoadieAppState of(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<RoadieAppState>();
    if (state == null) {
      throw Exception('SiteTopBar not found in the widget tree');
    }
    return state;
  }

  @override
  bool updateShouldNotify(RoadieAppState oldWidget) {
    return oldWidget.roadmap != roadmap;
  }
}

/// @no-doc
class RoadieApp extends StatefulWidget {
  /// @no-doc
  const RoadieApp({
    required this.child,
    super.key,
  });

  /// @no-doc
  final Widget child;

  @override
  State<RoadieApp> createState() => _RoadieAppState();
}

class _RoadieAppState extends State<RoadieApp> {
  final repository = DefaultRoadmapRepository();

  void _markAsDone(
    String moduleName,
    String lessonName,
    VoidCallback onChanged,
  ) {
    setState(() {
      repository.markAsDone(moduleName, lessonName);
      onChanged.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoadieAppState(
      roadmap: repository.cache,
      markAsDone: _markAsDone,
      child: widget.child,
    );
  }
}
