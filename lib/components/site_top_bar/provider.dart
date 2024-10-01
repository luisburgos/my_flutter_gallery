import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/site_top_bar/state.dart';

@Deprecated('Avoid usage')
class SiteTopBar extends StatefulWidget {
  @Deprecated('Avoid usage')
  const SiteTopBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<SiteTopBar> createState() => _SiteTopBarState();
}

class _SiteTopBarState extends State<SiteTopBar> {
  int _selectedIndex = 0;

  void _setIndex(int index, VoidCallback onChanged) {
    setState(() {
      _selectedIndex = index;
      onChanged.call();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    switch (currentRoute) {
      case '/':
        _selectedIndex = 0;
      case '/gallery':
        _selectedIndex = 1;
      case '/about':
        _selectedIndex = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SiteTopBarState(
      selectedIndex: _selectedIndex,
      setIndex: _setIndex,
      child: widget.child,
    );
  }
}
