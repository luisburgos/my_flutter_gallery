import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/site_top_bar/state.dart';

class SiteTopBar extends StatefulWidget {
  const SiteTopBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<SiteTopBar> createState() => _SiteTopBarState();
}

class _SiteTopBarState extends State<SiteTopBar> {
  int selectedIndex = 0;

  void _setIndex(int index, VoidCallback onChanged) {
    setState(() {
      selectedIndex = index;
      onChanged.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SiteTopBarState(
      selectedIndex: selectedIndex,
      setIndex: _setIndex,
      child: widget.child,
    );
  }
}
