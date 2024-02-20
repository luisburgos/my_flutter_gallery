import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/shared/side_bar.dart';

typedef OnLogoTap = VoidCallback;

class DashboardPageView extends StatefulWidget {
  const DashboardPageView({
    required this.appTitle,
    required this.initialSelectedItemId,
    required this.primaryColor,
    required this.accentColor,
    required this.bottomBarItems,
    required this.sideBarBodyItems,
    required this.sideBarFooterItems,
    required this.appLogoIcon,
    this.topBarItems = const [],
    this.smallWidthBreakpoint,
    this.mediumWidthBreakpoint,
    this.sideBarExpandedWidth = 180,
    super.key,
  });

  final String appTitle;
  final String initialSelectedItemId;
  final double sideBarExpandedWidth;
  final double? smallWidthBreakpoint;
  final double? mediumWidthBreakpoint;
  final Color primaryColor;
  final Color accentColor;
  final Widget appLogoIcon;
  final List<NavigationItemData> topBarItems;
  final List<NavigationItemData> bottomBarItems;
  final List<NavigationItemData> sideBarBodyItems;
  final List<NavigationItemData> sideBarFooterItems;

  @override
  State<DashboardPageView> createState() => _DashboardPageViewState();
}

class _DashboardPageViewState extends State<DashboardPageView> {
  bool isSideBarCollapsed = false;
  late String selectedItemId;

  @override
  void initState() {
    selectedItemId = widget.initialSelectedItemId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        var forceMobileDisplay = false;
        var forceWidthCollapse = false;
        if (widget.smallWidthBreakpoint != null) {
          forceMobileDisplay = screenWidth < widget.smallWidthBreakpoint!;
        }

        if (widget.mediumWidthBreakpoint != null) {
          forceWidthCollapse = screenWidth < widget.mediumWidthBreakpoint!;
        }

        final bottomBarItemsConfig = NavigationItemsConfig(
          isCollapsed: true,
          fillWidth: false,
          iconDefaultColor: widget.primaryColor,
          iconDefaultAccentColor: widget.accentColor,
        );

        final actualCollapseState = forceWidthCollapse || isSideBarCollapsed;
        final sideBarItemsConfig = NavigationItemsConfig(
          isCollapsed: actualCollapseState,
          fillWidth: true,
          iconDefaultColor: widget.primaryColor,
          iconDefaultAccentColor: widget.accentColor,
        );

        final theme = Theme.of(context);
        final backgroundColor = theme.colorScheme.background;
        if (forceMobileDisplay) {
          return Column(
            children: [
              TopBar(
                backgroundColor: backgroundColor,
                bodyBuilder: () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SideBarHeaderExpanded(
                        appTitle: widget.appTitle,
                        onLogoTap: _onLogoTap,
                      ),
                      ...NavigationItemsGenerator.generate(
                        data: widget.topBarItems,
                        config: bottomBarItemsConfig,
                        onPressed: _onItemTap,
                        selectedItemId: selectedItemId,
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: PageBody(
                  selectedItemId: selectedItemId,
                ),
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey.shade300,
              ),
              BottomBar(
                backgroundColor: backgroundColor,
                bodyBuilder: () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: NavigationItemsGenerator.generate(
                      data: widget.bottomBarItems,
                      config: bottomBarItemsConfig,
                      onPressed: _onItemTap,
                      selectedItemId: selectedItemId,
                    ),
                  );
                },
              ),
            ],
          );
        }

        return Row(
          children: [
            SideBar(
              isCollapsed: actualCollapseState,
              backgroundColor: backgroundColor,
              expandedWidth: widget.sideBarExpandedWidth,
              headerBuilder: () {
                if (actualCollapseState) {
                  return SideBarHeaderCollapsed(
                    onLogoTap: _onLogoTap,
                    appLogoIcon: widget.appLogoIcon,
                  );
                }
                return SideBarHeaderExpanded(
                  appTitle: widget.appTitle,
                  onLogoTap: _onLogoTap,
                );
              },
              bodyBuilder: () {
                return SideBarBody(
                  children: NavigationItemsGenerator.generate(
                    data: widget.sideBarBodyItems,
                    config: sideBarItemsConfig,
                    onPressed: _onItemTap,
                    selectedItemId: selectedItemId,
                  ),
                );
              },
              footerBuilder: () {
                return SideBarFooter(
                  children: NavigationItemsGenerator.generate(
                    data: widget.sideBarFooterItems,
                    config: sideBarItemsConfig,
                    onPressed: _onItemTap,
                    selectedItemId: selectedItemId,
                  ),
                );
              },
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey.shade300,
            ),
            Expanded(
              child: PageBody(
                selectedItemId: selectedItemId,
              ),
            ),
          ],
        );
      },
    );
  }

  void _onLogoTap() {
    setState(() {
      selectedItemId = widget.initialSelectedItemId;
    });
  }

  void _onItemTap(String _) {
    setState(() {
      selectedItemId = _;
    });
  }
}

class SideBarHeaderExpanded extends StatelessWidget {
  const SideBarHeaderExpanded({
    required this.appTitle,
    required this.onLogoTap,
    super.key,
  });

  final String appTitle;
  final OnLogoTap onLogoTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Align(
        alignment: Alignment.centerLeft,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onLogoTap,
            child: Text(
              appTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SideBarHeaderCollapsed extends StatelessWidget {
  const SideBarHeaderCollapsed({
    required this.onLogoTap,
    required this.appLogoIcon,
    super.key,
  });

  final Widget appLogoIcon;
  final OnLogoTap onLogoTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: IconButton.outlined(
        onPressed: onLogoTap,
        icon: appLogoIcon,
      ),
    );
  }
}

class SideBarBody extends StatelessWidget {
  const SideBarBody({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class SideBarFooter extends StatelessWidget {
  const SideBarFooter({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class NavigationItemData {
  NavigationItemData({
    required this.id,
    required this.label,
    required this.iconBuilder,
  });

  final String id;
  final String label;
  final Widget Function(Color) iconBuilder;
}

class NavigationItemsConfig {
  NavigationItemsConfig({
    required this.isCollapsed,
    required this.fillWidth,
    required this.iconDefaultColor,
    required this.iconDefaultAccentColor,
  });

  final bool isCollapsed;
  final bool fillWidth;
  final Color iconDefaultColor;
  final Color iconDefaultAccentColor;
}

class NavigationItemsGenerator {
  static List<Widget> generate({
    required List<NavigationItemData> data,
    required NavigationItemsConfig config,
    required void Function(String) onPressed,
    required String selectedItemId,
  }) {
    return data.map((item) {
      return NavigationItemView(
        data: item,
        config: config,
        selectedItemId: selectedItemId,
        onPressed: () => onPressed(item.id),
      );
    }).toList();
  }
}

class NavigationItemView extends StatelessWidget {
  const NavigationItemView({
    required this.data,
    required this.config,
    required this.onPressed,
    required this.selectedItemId,
    super.key,
  });

  final NavigationItemData data;
  final NavigationItemsConfig config;
  final VoidCallback onPressed;
  final String selectedItemId;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedItemId == data.id;
    final iconColor =
        isSelected ? config.iconDefaultAccentColor : config.iconDefaultColor;
    final labelFontWeight = isSelected ? FontWeight.w600 : FontWeight.w200;

    return Container(
      width: config.fillWidth ? double.infinity : null,
      margin: const EdgeInsets.only(bottom: 8),
      child: config.isCollapsed
          ? IconButton(
              onPressed: onPressed,
              icon: data.iconBuilder.call(iconColor),
              color: iconColor,
            )
          : TextButton.icon(
              style: TextButton.styleFrom(
                iconColor: iconColor,
                alignment: Alignment.centerLeft,
              ),
              onPressed: onPressed,
              icon: data.iconBuilder.call(iconColor),
              label: Text(
                data.label,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: labelFontWeight,
                  letterSpacing: 1.05,
                ),
              ),
            ),
    );
  }
}

// TODO(unassigned): change to a pageBodyBuilder(itemId) callback
class PageBody extends StatelessWidget {
  const PageBody({required this.selectedItemId, super.key});

  final String selectedItemId;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Text(selectedItemId.toUpperCase()),
      ),
    );
  }
}
