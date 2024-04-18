// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/clones/open_ai_ui/metadata.dart';
import 'package:my_flutter_gallery/shared/app_shell_one.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';

import 'cubit.dart';

const leftPaneWidth = 250.0;
const rightPaneWidth = 350.0;
const topBarHeight = 50.0;

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  void initState() {
    context.read<MyCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myCubit = context.watch<MyCubit>();
    //final items = myCubit.state.items;

    final pageData = OpenAiUiData();

    return AppShell1(
      /// App Specific
      appTitle: pageData.name,
      appLogoIcon: pageData.iconData,
      accentColor: pageData.seedColor,
      primaryColor: ColorsExtended.charcoal,
      // TODO(unassigned): fix hiding title breaks topBarItems alignment
      displayAppTitle: false,

      /// Responsive Breakpoints
      sideBarExpandedWidth: 280,

      // TODO(unassigned): improve force sidebar collapsed
      mediumWidthBreakpoint: 3000,

      /// Navigation Items
      initialSelectedItemId: _chatsId,
      sideBarBodyItems: [
        _chatsItemData,
        _hubItemData,
      ],
      sideBarFooterItems: [
        _localApiServerItemData,
        _settingsItemData,
      ],
      onSelectedItemId: (_) {},
      pageBodyBuilder: (_) {
        if (_ == _chatsId) return const ChatsMainView();
        if (_ == _hubId) return const HubMainView();
        if (_ == _localApiServerId) return const LocalApiServerMainView();
        if (_ == _settingsId) return const SettingsMainView();
        throw UnsupportedError('Unsupported view for id: $_');
      },
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _LeadingWrapper extends StatelessWidget {
  const _LeadingWrapper({
    required this.extra,
    required this.onCollapseTap,
  });

  final Widget extra;
  final VoidCallback onCollapseTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: leftPaneWidth,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onCollapseTap,
            icon: const Icon(
              FontAwesomeIcons.squareCaretRight,
            ),
          ),
          const Spacer(),
          extra,
          const _CustomDivider(),
        ],
      ),
    );
  }
}

class _TrailingWrapper extends StatelessWidget {
  const _TrailingWrapper({
    required this.label,
    required this.isCollapsed,
    required this.onCollapseTap,
  });

  final String label;
  final bool isCollapsed;
  final VoidCallback onCollapseTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: rightPaneWidth,
      ),
      child: Row(
        children: [
          if (!isCollapsed) ...[
            const _CustomDivider(),
            _Label(label),
          ],
          const Spacer(),
          IconButton(
            onPressed: onCollapseTap,
            icon: const Icon(
              FontAwesomeIcons.squareCaretLeft,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: topBarHeight,
      color: Colors.grey,
    );
  }
}

class ChatsMainView extends StatelessWidget {
  const ChatsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainViewBodyTemplate(
      header: (_) {
        return ValueListenableBuilder(
          valueListenable: _,
          builder: (context, state, widget) {
            return _TopBar(
              leading: _LeadingWrapper(
                onCollapseTap: _.toggleLeft,
                extra: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.squarePlus,
                  ),
                ),
              ),
              body: _Label(_chatsItemData.label),
              trailing: _TrailingWrapper(
                onCollapseTap: _.toggleRight,
                label: 'Thread Settings',
                isCollapsed: !state.isRightSidebarOpen,
              ),
            );
          },
        );
      },
      body: (_) {
        return ValueListenableBuilder(
          valueListenable: _,
          builder: (context, state, widget) {
            return _BodyPaneBuilder(
              displayLeftPane: state.isLeftSidebarOpen,
              displayRightPane: state.isRightSidebarOpen,
            );
          },
        );
      },
    );
  }
}

class HubMainView extends StatelessWidget {
  const HubMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainViewBodyTemplate(
      header: (_) {
        return _TopBar(
          body: _Label(_hubItemData.label),
        );
      },
      body: (_) {
        return const Placeholder();
      },
    );
  }
}

class LocalApiServerMainView extends StatelessWidget {
  const LocalApiServerMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainViewBodyTemplate(
      header: (_) {
        return ValueListenableBuilder(
          valueListenable: _,
          builder: (context, state, widget) {
            return _TopBar(
              body: _Label(_localApiServerItemData.label),
              trailing: _TrailingWrapper(
                label: 'Model Settings',
                onCollapseTap: _.toggleRight,
                isCollapsed: !state.isRightSidebarOpen,
              ),
            );
          },
        );
      },
      body: (_) {
        return ValueListenableBuilder(
          valueListenable: _,
          builder: (context, state, widget) {
            return _BodyPaneBuilder(
              displayLeftPane: state.isLeftSidebarOpen,
              displayRightPane: state.isRightSidebarOpen,
            );
          },
        );
      },
    );
  }
}

class SettingsMainView extends StatelessWidget {
  const SettingsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainViewBodyTemplate(
      header: (_) {
        return _TopBar(
          body: _Label(_settingsItemData.label),
        );
      },
      body: (_) {
        return const Placeholder();
      },
    );
  }
}

class MainViewBodyState {
  const MainViewBodyState({
    required this.isLeftSidebarOpen,
    required this.isRightSidebarOpen,
  });
  final bool isLeftSidebarOpen;
  final bool isRightSidebarOpen;

  MainViewBodyState copyWith({
    bool? isLeftSidebarOpen,
    bool? isRightSidebarOpen,
  }) {
    return MainViewBodyState(
      isLeftSidebarOpen: isLeftSidebarOpen ?? this.isLeftSidebarOpen,
      isRightSidebarOpen: isRightSidebarOpen ?? this.isRightSidebarOpen,
    );
  }
}

class MainViewBodyController extends ValueNotifier<MainViewBodyState> {
  MainViewBodyController(super.value);

  bool get isLeftSidebarOpen => value.isLeftSidebarOpen;
  bool get isRightSidebarOpen => value.isRightSidebarOpen;

  void toggleLeft() {
    value = value.copyWith(
      isLeftSidebarOpen: !value.isLeftSidebarOpen,
    );
  }

  void toggleRight() {
    value = value.copyWith(
      isRightSidebarOpen: !value.isRightSidebarOpen,
    );
  }
}

class MainViewBodyTemplate extends StatefulWidget {
  const MainViewBodyTemplate({
    required this.body,
    this.header,
    this.footer,
    super.key,
  });

  final Widget Function(MainViewBodyController)? header;
  final Widget Function(MainViewBodyController) body;
  final Widget Function(MainViewBodyController)? footer;

  @override
  State<MainViewBodyTemplate> createState() => _MainViewBodyTemplateState();
}

class _MainViewBodyTemplateState extends State<MainViewBodyTemplate> {
  final controller = MainViewBodyController(
    const MainViewBodyState(
      isLeftSidebarOpen: false,
      isRightSidebarOpen: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.header != null) widget.header!.call(controller),
        Expanded(
          child: widget.body.call(controller),
        ),
        if (widget.footer != null) widget.footer!.call(controller),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.body,
    this.leading,
    this.trailing,
    super.key,
  });

  final Widget? leading;
  final Widget body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: topBarHeight,
      ),
      child: Row(
        children: [
          if (leading != null) leading!,
          Expanded(
            child: body,
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class _BodyPaneBuilder extends StatelessWidget {
  const _BodyPaneBuilder({
    this.displayLeftPane = false,
    this.displayRightPane = false,
  });

  final bool displayLeftPane;
  final bool displayRightPane;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (displayLeftPane)
          Container(
            color: Colors.orange.shade50,
            constraints: const BoxConstraints(
              maxWidth: leftPaneWidth,
            ),
            child: Placeholder(
              color: Colors.red.shade200,
            ),
          ),
        Expanded(
          child: ColoredBox(
            color: Colors.red.shade50,
            child: Placeholder(
              color: Colors.red.shade200,
            ),
          ),
        ),
        if (displayRightPane)
          Container(
            color: Colors.cyan.shade50,
            constraints: const BoxConstraints(
              maxWidth: rightPaneWidth,
            ),
            child: Placeholder(
              color: Colors.cyan.shade200,
            ),
          ),
      ],
    );
  }
}

class FooterStatusBar extends StatelessWidget {
  const FooterStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade50,
      constraints: const BoxConstraints(
        maxHeight: 60,
      ),
      child: Placeholder(
        color: Colors.green.shade200,
      ),
    );
  }
}

const _chatsId = 'chats';
const _hubId = 'hub';
const _localApiServerId = 'local_api_server';
const _settingsId = 'settings';

final _chatsItemData = NavigationItemData(
  id: _chatsId,
  label: 'Chats',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.message,
    size: 16,
  ),
);
final _hubItemData = NavigationItemData(
  id: _hubId,
  label: 'Hub',
  iconBuilder: (_) => const Icon(
    Icons.grid_view_rounded,
    size: 20,
  ),
);
final _localApiServerItemData = NavigationItemData(
  id: _localApiServerId,
  label: 'Local API Server',
  iconBuilder: (_) => const Icon(
    Icons.terminal,
    size: 20,
  ),
);
final _settingsItemData = NavigationItemData(
  id: _settingsId,
  label: 'Settings',
  iconBuilder: (_) => const Icon(
    Icons.settings,
    size: 20,
  ),
);
