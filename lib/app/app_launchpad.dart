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
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final apps = state.items;
    final selectedItem = state.selectedItem;

    return SimpleGrid<GalleryItemData>(
      items: apps,
      itemBuilder: (item) {
        final isSelected = item.id == selectedItem?.id;
        final theme = Theme.of(context).colorScheme;

        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: isSelected
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 2,
                    color: theme.primary,
                  ),
                )
              : null,
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
