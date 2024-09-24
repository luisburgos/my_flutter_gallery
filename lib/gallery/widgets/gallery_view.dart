import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/gallery/widgets/gallery_items.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final apps = state.items;

    return GalleryItemsGrid(
      items: apps,
      onItemTap: (item) {
        _onLaunchTap(context, item);
      },
    );
  }

  void _onLaunchTap(BuildContext context, GalleryItemData item) {
    context.read<MyFlutterGalleryCubit>().setSelectedAppById(item.id);
    context.navigateToGalleryItem(item.id);
  }
}
