// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/legacy/clones/open_ai_ui/metadata.dart';
import 'package:my_flutter_gallery/shared/app_shell_one.dart';
import 'package:my_flutter_gallery/shared/app_version.dart';
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
    //final myCubit = context.watch<MyCubit>();
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
  const _Label(this.text);

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
    required this.isCollapsed,
    required this.onCollapseTap,
  });

  final Widget extra;
  final bool isCollapsed;
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
            icon: Icon(
              isCollapsed
                  ? FontAwesomeIcons.squareCaretRight
                  : FontAwesomeIcons.squareCaretLeft,
              size: 18,
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
            icon: Icon(
              isCollapsed
                  ? FontAwesomeIcons.squareCaretLeft
                  : FontAwesomeIcons.squareCaretRight,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

final borderColor = Colors.grey.shade300;
const borderWidth = 1.0;

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: borderWidth,
      height: topBarHeight,
      color: borderColor,
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
                isCollapsed: !state.isLeftSidebarOpen,
                onCollapseTap: _.toggleLeft,
                extra: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.squarePlus,
                    size: 18,
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
        return const _BodyPaneBuilder(
          body: _HubBody(),
        );
      },
    );
  }
}

class _HubBody extends StatelessWidget {
  const _HubBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const _RowItemPlaceholder(
            height: 250,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: List.generate(
                10,
                (index) => const _RowItemPlaceholder(height: 80),
              ),
            ),
          ),
        ],
      ),
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
              displayLeftPane: true,
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
        return const _BodyPaneBuilder(
          displayLeftPane: true,
          leftPane: _SettingsLeftPane(),
        );
      },
    );
  }
}

class _SettingsLeftPane extends StatelessWidget {
  const _SettingsLeftPane();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => const _RowItemPlaceholder(),
      ),
    );
  }
}

class _RowItemPlaceholder extends StatelessWidget {
  const _RowItemPlaceholder({
    this.height = 30,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(
        top: 8,
        right: 8,
        bottom: 4,
        left: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
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
      isLeftSidebarOpen: true,
      isRightSidebarOpen: true,
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
        if (widget.footer != null)
          widget.footer!.call(controller)
        else
          const FooterStatusBar(),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.body,
    this.leading,
    this.trailing,
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
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor),
        ),
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
    this.leftPane,
    this.body,
  });

  final bool displayLeftPane;
  final bool displayRightPane;

  final Widget? leftPane;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (displayLeftPane)
          Container(
            constraints: const BoxConstraints(
              maxWidth: leftPaneWidth,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: borderColor),
              ),
            ),
            child: leftPane ??
                const Center(
                  child: Text('Left Pane'),
                ),
          ),
        Expanded(
          child: body ??
              const Center(
                child: Text('Body'),
              ),
        ),
        if (displayRightPane)
          Container(
            constraints: const BoxConstraints(
              maxWidth: rightPaneWidth,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: borderColor),
              ),
            ),
            child: const Center(
              child: Text('Right Pane'),
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
      constraints: const BoxConstraints(
        minHeight: topBarHeight,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: borderColor),
        ),
      ),
      child: Row(
        children: [
          const Spacer(),
          CurrentAppVersion(
            withBuildNumber: false,
            builder: (_) {
              return Text(
                'v$_',
                style: TextStyle(color: Colors.grey.shade600),
              );
            },
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.discord,
              size: 16,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.github,
              size: 16,
            ),
          ),
        ],
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
