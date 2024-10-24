import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_gallery/shared/easy_shortcuts/widget.dart';

class DefaultGlobalAppShortcuts extends StatelessWidget {
  const DefaultGlobalAppShortcuts({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyShortcuts(
      shortcutsBuilder: (state) => {
        SingleActivator(
          LogicalKeyboardKey.keyK,
          meta: state.isMac,
          control: !state.isMac,
        ): VoidCallbackIntent(
          () {},
        ),
      },
      child: child,
    );
  }
}
