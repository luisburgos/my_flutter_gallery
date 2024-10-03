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
              const SocialButtons(withPersonalGithub: false),
            ],
          ),
          ResponsiveView(
            smChild: GalleryItemDetailPageMobile(app: app),
            child: GalleryItemDetailBody(app: app),
          ),
        ],
      ),
    );
  }
}

class GalleryItemDetailPageMobile extends StatelessWidget {
  const GalleryItemDetailPageMobile({
    required this.app,
    super.key,
  });

  final GalleryItemData app;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ShadCard(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            GalleryItemCover(
              icon: app.iconData,
              iconColor: app.seedColor,
              width: 100,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Column(
                children: [
                  GalleryItemBrief(
                    padding: EdgeInsets.zero,
                    name: app.name,
                    description: app.description,
                  ),
                  const SizedBox(height: 20),
                  ItemActionButtons(
                    appId: app.id,
                    githubRepoUrl: app.githubRepoUrl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryItemDetailBody extends StatelessWidget {
  const GalleryItemDetailBody({
    required this.app,
    super.key,
  });

  final GalleryItemData app;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ShadCard(
        child: SizedBox(
          height: 300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GalleryItemCover(
                icon: app.iconData,
                width: 100,
                height: 100,
                iconColor: app.seedColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GalleryItemBrief(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        name: app.name,
                        description: app.description,
                      ),
                    ),
                    ItemActionButtons(
                      appId: app.id,
                      githubRepoUrl: app.githubRepoUrl,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

class ItemActionButtons extends StatelessWidget {
  const ItemActionButtons({
    required this.appId,
    this.githubRepoUrl,
    super.key,
  });

  final String appId;
  final String? githubRepoUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        if (githubRepoUrl != null)
          GithubButton(
            withBorder: true,
            url: githubRepoUrl!,
          ),
        const SizedBox(width: 8),
        ShadButton(
          size: ShadButtonSize.sm,
          child: const Text('LAUNCH'),
          onPressed: () {
            context.navigateToItemRunMode(appId);
          },
        ),
      ],
    );
  }
}
