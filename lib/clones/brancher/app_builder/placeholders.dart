import 'package:flutter/material.dart';

class ColoredPlaceholder extends StatelessWidget {
  const ColoredPlaceholder({
    required this.label,
    required this.color,
    this.width,
    this.height,
    this.child,
    this.padding,
    super.key,
  });

  final String label;
  final Color color;
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      color: child == null ? color : Colors.transparent,
      fallbackWidth: width ?? 400,
      fallbackHeight: height ?? 400,
      child: SizedBox.expand(
        child: ColoredBox(
          color: color.withOpacity(0.5),
          child: Center(
            child: Container(
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
              color: child == null ? color : null,
              child: child ??
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceholdersPage extends StatelessWidget {
  const PlaceholdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          PageSideBarPlaceholder(),
          Expanded(
            child: PageBodyPlaceholder(),
          ),
        ],
      ),
    );
  }
}

class PageSideBarPlaceholder extends StatelessWidget {
  const PageSideBarPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredPlaceholder(
      label: 'SideBar',
      color: Colors.lightGreen,
      width: 300,
    );
  }
}

class PageBodyPlaceholder extends StatelessWidget {
  const PageBodyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredPlaceholder(
      label: 'Body',
      color: Colors.indigoAccent,
      width: double.infinity,
      height: double.infinity,
      child: PageBodyContent(),
    );
  }
}

class PageBodyContent extends StatelessWidget {
  const PageBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderPlaceholder(),
        Divider(
          color: Colors.grey,
          thickness: 0.2,
          height: 1,
        ),
        Expanded(
          child: BodyPlaceholder(),
        ),
      ],
    );
  }
}

class HeaderPlaceholder extends StatelessWidget {
  const HeaderPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredPlaceholder(
      label: 'Header',
      color: Colors.orangeAccent,
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          Text('Page Title'),
          Spacer(),
          ActionItemPlaceholder(
            code: 'A',
          ),
          ActionItemPlaceholder(
            code: 'S',
          ),
          ActionItemPlaceholder(
            code: 'P',
          ),
        ],
      ),
    );
  }
}

class BodyPlaceholder extends StatelessWidget {
  const BodyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredPlaceholder(
      label: 'Body',
      color: Colors.lightBlueAccent,
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: InspectorPlaceholder(),
          ),
          Expanded(
            child: PreviewPlaceholder(),
          )
        ],
      ),
    );
  }
}

class InspectorPlaceholder extends StatelessWidget {
  const InspectorPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredPlaceholder(
      label: 'Inspector',
      color: Colors.deepOrangeAccent,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          InspectorGroupPlaceholder(
            title: 'Section A',
          ),
          InspectorGroupPlaceholder(
            title: 'Section B',
          ),
          InspectorGroupPlaceholder(
            title: 'Section C',
          ),
        ],
      ),
    );
  }
}

class PreviewPlaceholder extends StatelessWidget {
  const PreviewPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredPlaceholder(
      label: 'Preview',
      color: Colors.redAccent,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class ActionItemPlaceholder extends StatelessWidget {
  const ActionItemPlaceholder({
    required this.code,
    super.key,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: ColoredPlaceholder(
        label: code,
        color: Colors.yellowAccent,
        width: 40,
        height: 40,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class InspectorGroupPlaceholder extends StatelessWidget {
  const InspectorGroupPlaceholder({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: ColoredPlaceholder(
        label: title,
        color: Colors.greenAccent,
        height: 60,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
