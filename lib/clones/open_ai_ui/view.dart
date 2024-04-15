// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

const usePlaceholders = true;
const leftPaneWidth = 250.0;
const rightPaneWidth = 350.0;

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
    final items = myCubit.state.items;

    if (usePlaceholders) {
      return PlaceholdersStructure(
        body: () {
          return const Body();
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Items count: ${items.length}'),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(
                  item.name,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PlaceholdersStructure extends StatelessWidget {
  const PlaceholdersStructure({
    required this.body,
    super.key,
  });

  final Widget Function() body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SideBar(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: body(),
              ),
              const FooterStatusBar(),
            ],
          ),
        ),
      ],
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      constraints: const BoxConstraints(
        maxWidth: 60,
      ),
      child: Placeholder(
        color: Colors.blue.shade200,
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool displayLeftPane = false;
  bool displayRightPane = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyHeader(
          trailing: Placeholder(
            color: Colors.greenAccent.shade200,
            fallbackWidth: 100,
            fallbackHeight: 40,
          ),
          displayTrailing: displayRightPane,
          onLeftTap: () {
            setState(() {
              displayLeftPane = !displayLeftPane;
            });
          },
          onRightTap: () {
            setState(() {
              displayRightPane = !displayRightPane;
            });
          },
        ),
        Expanded(
          child: Row(
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
          ),
        ),
      ],
    );
  }
}

class ButtonPlaceholder extends StatelessWidget {
  const ButtonPlaceholder({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        color: Colors.red.shade50,
      ),
    );
  }
}

class BodyHeader extends StatelessWidget {
  const BodyHeader({
    required this.trailing,
    required this.displayTrailing,
    required this.onRightTap,
    required this.onLeftTap,
    super.key,
  });

  final VoidCallback onRightTap;
  final VoidCallback onLeftTap;
  final Widget trailing;
  final bool displayTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade50,
      constraints: const BoxConstraints(
        maxHeight: 100,
      ),
      child: Placeholder(
        color: Colors.yellow.shade200,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Container(
                color: Colors.orange.shade50,
                constraints: const BoxConstraints(
                  maxWidth: leftPaneWidth,
                ),
                child: Row(
                  children: [
                    ButtonPlaceholder(
                      onTap: onLeftTap,
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TopBarTitle(),
              ),
              Container(
                color: Colors.cyan.shade50,
                constraints: const BoxConstraints(
                  maxWidth: rightPaneWidth,
                ),
                child: Row(
                  children: [
                    if (displayTrailing) trailing,
                    const Spacer(),
                    ButtonPlaceholder(
                      onTap: onRightTap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBarTitle extends StatelessWidget {
  const TopBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Top Bar Title');
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
