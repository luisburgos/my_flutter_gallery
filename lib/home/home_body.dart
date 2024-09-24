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
      Expanded(
        child: Center(
          child: Container(
            //color: Colors.blue,
            constraints: const BoxConstraints(maxWidth: 400),
            child: const AboutView(),
          ),
        ),
      ),
      Expanded(
        child: Center(
          child: Container(
            //color: Colors.red,
            constraints: const BoxConstraints(maxWidth: 400),
            child: const LatestGalleryItemsView(),
          ),
        ),
      ),
    ];

    if (isMobile(context)) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(40),
              child: AboutView(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
              child: LatestGalleryItemsView(),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
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
            fontWeight: FontWeight.w100,
            color: subtitleColor,
          ),
        ),
        Text(
          'Lorem ipsum lorem ipsum lorem 🎯',
          style: TextStyle(
            fontSize: 18,
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
