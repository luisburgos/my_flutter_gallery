import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpenCommandBarShortcut extends StatelessWidget {
  const OpenCommandBarShortcut({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        LogicalKeySet(
          // TODO(unassigned): change to CMD key
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.keyK,
        ): () {
          // TODO(unassigned): change to command bar dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'SHORTCUT: ${LogicalKeyboardKey.control.debugName} + '
                '${LogicalKeyboardKey.keyK.debugName}',
              ),
              duration: const Duration(milliseconds: 900),
            ),
          );
          Navigator.of(context).pushNamed('/');
        },
      },
      child: Focus(
        autofocus: true,
        child: child,
      ),
    );
  }
}
