import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/shared/easy_shortcuts/state.dart';

class EasyShortcutsBuilderConfig {
  const EasyShortcutsBuilderConfig({required this.isMac});

  final bool isMac;
}

class EasyShortcuts extends StatefulWidget {
  const EasyShortcuts({
    required this.child,
    required this.shortcutsBuilder,
    super.key,
  });

  final Widget child;

  @override
  State<EasyShortcuts> createState() => _EasyShortcutsState();

  final Map<ShortcutActivator, Intent> Function(
    EasyShortcutsBuilderConfig,
  ) shortcutsBuilder;
}

class _EasyShortcutsState extends State<EasyShortcuts> {
  final _shortcutsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final isMac = defaultTargetPlatform == TargetPlatform.macOS;
    final isShortcutsSupported = isMac ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.windows;

    return Shortcuts(
      shortcuts: widget.shortcutsBuilder(
        EasyShortcutsBuilderConfig(
          isMac: isMac,
        ),
      ),
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: EasyShortcutsState(
          shortcutsFocusNode: _shortcutsFocusNode,
          child: Builder(
            builder: (_) {
              final shortcutsFocusNode =
                  EasyShortcutsState.of(_).shortcutsFocusNode;

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
