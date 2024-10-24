import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/state.dart';
import 'package:my_flutter_gallery/components/social_buttons.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_brief.dart';
import 'package:my_flutter_gallery/gallery/item/widgets/gallery_item_cover.dart';
import 'package:my_flutter_gallery/utils/constrained_page.dart';
import 'package:my_flutter_gallery/utils/responsive_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemDetailsPage extends StatelessWidget {
  const GalleryItemDetailsPage({
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
      return GalleryItemDetailPage(
        app: find,
        displayDecoration: true,
      );
    }
    return const UnimplementedGalleryItemPage();
  }
}

class GalleryItemDetailPage extends StatelessWidget {
  const GalleryItemDetailPage({
    required this.app,
    required this.displayDecoration,
    super.key,
  });

  final GalleryItemData app;
  final bool displayDecoration;

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
            smChild: GalleryItemDetailPageMobile(
              app: app,
              displayDecoration: displayDecoration,
            ),
            child: GalleryItemDetailBody(
              app: app,
              displayDecoration: displayDecoration,
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryItemDetailPageMobile extends StatelessWidget {
  const GalleryItemDetailPageMobile({
    required this.app,
    required this.displayDecoration,
    super.key,
  });

  final GalleryItemData app;
  final bool displayDecoration;

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
              width: double.infinity,
              height: galleryItemCoverHeight,
              coverBuilder: app.coverBuilder,
              displayDecoration: displayDecoration,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GalleryItemNameText(
                    app.name,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  GalleryItemDescriptionText(
                    app.description,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Spacer(),
                      ItemActionButtons(
                        appId: app.id,
                        githubRepoUrl: app.githubRepoUrl,
                      ),
                    ],
                  )
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
    required this.displayDecoration,
    super.key,
  });

  final GalleryItemData app;
  final bool displayDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ShadCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GalleryItemCover(
              margin: EdgeInsets.zero,
              icon: app.iconData,
              iconColor: app.seedColor,
              width: double.infinity,
              height: 200,
              coverBuilder: app.coverBuilder,
              displayDecoration: displayDecoration,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: GalleryItemNameText(
                    app.name,
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ItemActionButtons(
                  appId: app.id,
                  githubRepoUrl: app.githubRepoUrl,
                ),
              ],
            ),
            const SizedBox(height: 12),
            GalleryItemDescriptionText(
              app.description,
              fontSize: 18,
            ),
          ],
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
            context.navigateToGalleryItemRunner(appId);
          },
        ),
      ],
    );
  }
}

class SiteTopBarContainer extends StatelessWidget {
  const SiteTopBarContainer({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 4,
      ),
      child: Row(
        children: children,
      ),
    );
  }
}
