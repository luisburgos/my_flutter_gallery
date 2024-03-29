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
    final displayMode = state.displayMode;

    Widget body = Center(
      child: SizedBox(
        width: 600,
        child: ListView.builder(
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final item = apps[index];
            final isSelected = item.id == selectedItem?.id;
            final theme = Theme.of(context).colorScheme;

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: isSelected
                    ? Border.all(
                        width: 4,
                        color: theme.primary,
                      )
                    : null,
              ),
              child: ListTile(
                title: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () => _onLaunchTap(context, item),
                  child: const Text('LAUNCH'),
                ),
              ),
            );
          },
        ),
      ),
    );
    if (displayMode.isGrid) {
      body = SimpleGrid<GalleryItemData>(
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
    return body;
  }

  void _onLaunchTap(BuildContext context, GalleryItemData item) {
    context.read<MyFlutterGalleryCubit>().setSelectedAppById(item.id);
    Navigator.of(context).pushNamed('/');
  }
}

class UnimplementedGalleryItemPage extends StatelessWidget {
  const UnimplementedGalleryItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Unimplemented item'),
      ),
    );
  }
}
