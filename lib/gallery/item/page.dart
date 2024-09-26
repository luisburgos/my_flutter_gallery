import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/state.dart';
import 'package:my_flutter_gallery/components/site_top_bar/site_top_bar.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_brief.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_cover.dart';
import 'package:my_flutter_gallery/utils/constrained_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemHomePage extends StatelessWidget {
  const GalleryItemHomePage({
    required this.itemId,
    this.runMode = false,
    super.key,
  });

  final bool runMode;
  final String? itemId;

  @override
  Widget build(BuildContext context) {
    final state = GalleryItemsState.of(context);
    final find = state.items.where((app) => app.id == itemId).firstOrNull;
    if (find != null) {
      return GalleryItemDetailPage(app: find);
    }
    return const UnimplementedGalleryItemPage();
  }
}

class GalleryItemRunnerPage extends StatelessWidget {
  const GalleryItemRunnerPage({
    required this.itemId,
    super.key,
  });

  final String? itemId;

  @override
  Widget build(BuildContext context) {
    final state = GalleryItemsState.of(context);
    final find = state.items.where((app) => app.id == itemId).firstOrNull;
    if (find != null) {
      return find.pageBuilder(context);
    }
    return const UnimplementedGalleryItemPage();
  }
}

class GalleryItemDetailPage extends StatelessWidget {
  const GalleryItemDetailPage({
    required this.app,
    super.key,
  });

  final GalleryItemData app;

  @override
  Widget build(BuildContext context) {
    return ConstrainedPage(
      child: Column(
        children: [
          SiteTopBarContainer(
            children: [
              ShadButton.outline(
                decoration: const ShadDecoration(
                  border: ShadBorder.none,
                ),
                icon: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 14,
                ),
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.navigateToHome();
                  }
                },
              ),
              const Spacer(),
              const SocialButtons(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Expanded(
              child: ShadCard(
                child: SizedBox(
                  height: 300,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GalleryItemCover(
                        icon: app.iconData,
                        mode: GalleryItemCoverMode.square,
                        sizeMultiplier: 3,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: GalleryItemBrief(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                name: app.name,
                                description: app.description,
                              ),
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                ShadButton(
                                  size: ShadButtonSize.sm,
                                  child: const Text('LAUNCH'),
                                  onPressed: () {
                                    context.navigateToItemRunMode(app.id);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
