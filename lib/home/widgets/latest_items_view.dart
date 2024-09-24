import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_commands.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/app/ui_wrappers.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LatestItemsView extends StatelessWidget {
  const LatestItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final apps = state.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'LATEST BITS',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            ShadButton.link(
              padding: EdgeInsets.zero,
              onPressed: () => selectGalleryPage(context),
              child: const Text('View all'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        BetaGalleryItem(
          margin: EdgeInsets.zero,
          item: apps[0],
          onItemTap: (_) => context.navigateToGalleryItem(_.id),
          mode: BetaGalleryItemMode.preview,
        ),
        const SizedBox(height: 14),
        BetaGalleryItem(
          margin: EdgeInsets.zero,
          item: apps[1],
          onItemTap: (_) => context.navigateToGalleryItem(_.id),
          mode: BetaGalleryItemMode.preview,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
