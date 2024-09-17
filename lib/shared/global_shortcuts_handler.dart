import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalShortcutsHandler extends StatelessWidget {
  const GlobalShortcutsHandler({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const firstKey = LogicalKeyboardKey.meta;
    const secondKey = LogicalKeyboardKey.keyK;

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        LogicalKeySet(
          firstKey,
          secondKey,
        ): () {
          // TODO(unassigned): change to command bar dialog
          /*ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'SHORTCUT: ${firstKey.debugName} + '
                '${secondKey.debugName}',
              ),
              duration: const Duration(milliseconds: 900),
            ),
          );*/
          Navigator.of(context).pushNamed('/launchpad');
        },
      },
      child: Focus(
        autofocus: true,
        child: child,
      ),
    );
  }
}
