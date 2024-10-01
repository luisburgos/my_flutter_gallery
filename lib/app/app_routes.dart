import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_gallery/gallery/item/page.dart';
import 'package:my_flutter_gallery/gallery/page.dart';
import 'package:my_flutter_gallery/home/page.dart';
import 'package:my_flutter_gallery/shared/global_shortcuts_handler.dart';

class AppRoutes {
  static const root = '/';
  static const gallery = '/gallery';
  static const about = '/about';
  static const run = '/run/:id';
  static const galleryItem = '/gallery/:id';
}

final defaultAppRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.root,
      builder: (_, __) => const GlobalShortcuts(
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.gallery,
      builder: (_, __) => const GalleryPage(),
    ),
    GoRoute(
      path: AppRoutes.galleryItem,
      builder: (_, __) {
        final itemId = __.pathParameters['id'];

        return GlobalShortcuts(
          child: GalleryItemHomePage(
            itemId: itemId,
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.run,
      builder: (_, __) {
        final itemId = __.pathParameters['id'];

        return GlobalShortcuts(
          child: GalleryItemRunnerPage(
            itemId: itemId,
          ),
        );
      },
    ),
  ],
);

extension BuildContextNavigationMethods<T> on BuildContext {
  void navigateToGallery() {
    go(AppRoutes.gallery);
  }

  void navigateToHome() {
    go(AppRoutes.root);
  }

  void navigateToAbout() {
    go(AppRoutes.about);
  }

  void navigateToGalleryItem(String itemId) {
    go(
      AppRoutes.galleryItem.replaceAll(':id', itemId),
    );
  }

  void navigateToItemRunMode(String itemId) {
    go(
      AppRoutes.run.replaceAll(':id', itemId),
    );
  }
}
