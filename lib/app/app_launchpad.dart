import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/ui_wrappers.dart';
import 'package:my_flutter_gallery/shared/simple_grid.dart';

const betaGallery = true;

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
      if (betaGallery) {
        body = BetaGallery(
            items: apps,
            onItemTap: (item) {
              _onLaunchTap(context, item);
            });
      } else {
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

class BetaGallery extends StatelessWidget {
  const BetaGallery({
    required this.items,
    required this.onItemTap,
    super.key,
  });

  final List<GalleryItemData> items;
  final void Function(GalleryItemData) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorsExtended.neoBackground,
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Header(),
              ),
              Spacer(),
            ],
          ),
          const WrapperDivider(),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 840),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return BetaGalleryItem(
                        item: item,
                        onItemTap: onItemTap,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const WrapperDivider(),
          const Row(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: WrapperSupportButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const items = [
  {
    'name': 'Popcorn Flavor Picker',
    'type': 'sample',
  },
  {
    'name': 'Weekly Habit Tracker',
    'type': 'sample',
  },
  {
    'name': 'AI Apps Builder',
    'type': 'sample',
  },
  {
    'name': 'App Shell One',
    'type': 'sample',
  },
  {
    'name': 'Countdown Timer Button',
    'type': 'sample',
  },
  {
    'name': 'Expense Splitter',
    'type': 'sample',
  },
];
