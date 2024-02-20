import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';

class LaunchpadPage extends StatelessWidget {
  const LaunchpadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LaunchpadView(),
    );
  }
}

class LaunchpadView extends StatelessWidget {
  const LaunchpadView({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleGrid<LaunchpadAppData>(
      items: const [
        // TODO(unassigned): change appId to reference global constants
        LaunchpadAppData(
          appId: 'INST-00',
          name: 'Instagram',
          rootRoute: '/',
        ),
        LaunchpadAppData(
          appId: 'PERP-00',
          name: 'Perplexity',
          rootRoute: '/',
        ),
        LaunchpadAppData(
          appId: 'SUPN-00',
          name: 'Supernotes',
          rootRoute: '/',
        ),
      ],
      itemBuilder: (item) {
        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO(unassigned): use title large text style
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<MyFlutterGalleryCubit>()
                          .setAppById(item.appId);
                      Navigator.of(context).pushNamed(item.rootRoute);
                    },
                    child: const Text(
                      'LAUNCH',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LaunchpadAppData {
  const LaunchpadAppData({
    required this.appId,
    required this.name,
    required this.rootRoute,
  });

  final String appId;
  final String name;
  final String rootRoute;
}

class SimpleGrid<T> extends StatelessWidget {
  const SimpleGrid({
    required this.items,
    required this.itemBuilder,
    super.key,
  });

  final List<T> items;
  final Widget Function(T) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: items.isEmpty ? 1 : items.length,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: items.length * 1.2 / items.length,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return itemBuilder(item);
      },
    );
  }
}
