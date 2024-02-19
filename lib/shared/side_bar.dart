import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    required this.bodyBuilder,
    this.isCollapsed = false,
    this.expandedWidth = 300,
    this.collapsedWidth = 80,
    this.backgroundColor = Colors.black,
    this.headerBuilder,
    this.footerBuilder,
    super.key,
  });

  final bool isCollapsed;
  final double expandedWidth;
  final double collapsedWidth;
  final Color backgroundColor;

  final Widget Function()? headerBuilder;
  final Widget Function() bodyBuilder;
  final Widget Function()? footerBuilder;

  @override
  Widget build(BuildContext context) {
    final sideBarWidth = isCollapsed ? collapsedWidth : expandedWidth;
    return Container(
      color: backgroundColor,
      constraints: BoxConstraints(
        minWidth: sideBarWidth,
      ),
      child: Column(
        children: [
          if (headerBuilder != null)
            SizedBox(
              width: sideBarWidth,
              child: headerBuilder!.call(),
            ),
          Expanded(
            child: SizedBox(
              width: sideBarWidth,
              child: bodyBuilder.call(),
            ),
          ),
          if (footerBuilder != null)
            SizedBox(
              width: sideBarWidth,
              child: footerBuilder!.call(),
            ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    required this.bodyBuilder,
    this.backgroundColor = Colors.black,
    this.barHeight = 60,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 12,
    ),
    super.key,
  });

  final Color backgroundColor;
  final double barHeight;
  final EdgeInsetsGeometry padding;
  final Widget Function() bodyBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      constraints: BoxConstraints(
        minWidth: barHeight,
      ),
      padding: padding,
      child: bodyBuilder.call(),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.bodyBuilder,
    this.backgroundColor = Colors.black,
    this.barHeight = 60,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 12,
    ),
    super.key,
  });

  final Color backgroundColor;
  final double barHeight;
  final EdgeInsetsGeometry padding;
  final Widget Function() bodyBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      constraints: BoxConstraints(
        minWidth: barHeight,
      ),
      padding: padding,
      child: bodyBuilder.call(),
    );
  }
}
