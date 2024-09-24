import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/app/ui_wrappers.dart';
import 'package:my_flutter_gallery/utils/is_mobile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      Flexible(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 380),
            child: const AboutView(),
          ),
        ),
      ),
      const SizedBox(width: 20),
      Flexible(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 380),
            child: const LatestGalleryItemsView(),
          ),
        ),
      ),
    ];

    if (isSmallWidth(context)) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: const AboutView(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: LatestGalleryItemsView(),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleColor = ShadTheme.of(context).colorScheme.primary;
    final subtitleColor = ShadTheme.of(context).colorScheme.mutedForeground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm Luis 👋",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer based in México 🇲🇽',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: titleColor,
          ),
        ),
        Text(
          'Lorem ipsum lorem ipsum lorem Lorem ipsum lorem ipsum lorem 🎯',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
}

class LatestGalleryItemsView extends StatelessWidget {
  const LatestGalleryItemsView({super.key});

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
              onPressed: context.navigateToGallery,
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
