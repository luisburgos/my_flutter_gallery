import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/shared/simple_grid.dart';

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
    final apps = context.watch<MyFlutterGalleryCubit>().state.items;

    return SimpleGrid<GalleryItemData>(
      items: apps,
      itemBuilder: (item) {
        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    onPressed: () => _onLaunchTap(context, item),
                    child: const Text('LAUNCH'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onLaunchTap(BuildContext context, GalleryItemData item) {
    context.read<MyFlutterGalleryCubit>().setSelectedAppById(item.id);
    Navigator.of(context).pushNamed('/');
  }
}
