import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_gallery/app/app_shortcuts.dart';
import 'package:my_flutter_gallery/gallery/item/details/page.dart';
import 'package:my_flutter_gallery/gallery/item/runner/page.dart';
import 'package:my_flutter_gallery/home/page.dart';

class AppRoutes {
  static const root = '/';
  static const galleryItem = '/gallery/:id';
  static const galleryItemRun = '$galleryItem/run';
}

final defaultAppRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.root,
      builder: (_, __) => const DefaultGlobalAppShortcuts(
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.galleryItem,
      builder: (_, __) {
        final itemId = __.pathParameters['id'];

        return DefaultGlobalAppShortcuts(
          child: GalleryItemDetailsPage(
            itemId: itemId,
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.galleryItemRun,
      builder: (_, __) {
        final itemId = __.pathParameters['id'];

        return DefaultGlobalAppShortcuts(
          child: GalleryItemRunnerPage(
            itemId: itemId,
          ),
        );
      },
    ),
  ],
);

extension BuildContextNavigationMethods<T> on BuildContext {
  void navigateToHome() {
    go(AppRoutes.root);
  }

  void navigateToGalleryItem(String itemId) {
    go(
      AppRoutes.galleryItem.replaceAll(':id', itemId),
    );
  }

  void navigateToGalleryItemRunner(String itemId) {
    go(
      AppRoutes.galleryItemRun.replaceAll(':id', itemId),
    );
  }
}
