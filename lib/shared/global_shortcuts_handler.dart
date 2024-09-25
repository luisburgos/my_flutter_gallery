import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_gallery/app/app_commands.dart';

class GlobalShortcutsState extends InheritedWidget {
  const GlobalShortcutsState({
    required this.shortcutsFocusNode,
    required super.child,
    super.key,
  });

  final FocusNode shortcutsFocusNode;

  static GlobalShortcutsState of(BuildContext context) {
    final state =
        context.dependOnInheritedWidgetOfExactType<GlobalShortcutsState>();
    if (state == null) {
      throw Exception('GlobalShortcuts not found in the widget tree');
    }
    return state;
  }

  @override
  bool updateShouldNotify(GlobalShortcutsState oldWidget) {
    return oldWidget.shortcutsFocusNode.hasFocus != shortcutsFocusNode.hasFocus;
  }
}

class GlobalShortcuts extends StatefulWidget {
  const GlobalShortcuts({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<GlobalShortcuts> createState() => _GlobalShortcutsState();
}

class _GlobalShortcutsState extends State<GlobalShortcuts> {
  final _shortcutsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final isMac = defaultTargetPlatform == TargetPlatform.macOS;
    final isShortcutsSupported = isMac ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.windows;

    return Shortcuts(
      shortcuts: {
        SingleActivator(
          LogicalKeyboardKey.keyK,
          meta: isMac,
          control: !isMac,
        ): VoidCallbackIntent(
          () => selectGalleryPage(context),
        ),
      },
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: GlobalShortcutsState(
          shortcutsFocusNode: _shortcutsFocusNode,
          child: Builder(
            builder: (_) {
              final shortcutsFocusNode =
                  GlobalShortcutsState.of(_).shortcutsFocusNode;

              return Focus(
                autofocus: isShortcutsSupported,
                focusNode: shortcutsFocusNode,
                child: GestureDetector(
                  onTap: () => isShortcutsSupported &&
                          shortcutsFocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(shortcutsFocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: widget.child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
