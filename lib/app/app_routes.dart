import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_gallery/app/app.dart';
import 'package:my_flutter_gallery/app/app_launchpad.dart';
import 'package:my_flutter_gallery/home/home_page.dart';

class AppRoutes {
  static const root = '/';
  static const gallery = '/gallery';
  static const galleryItem = '/gallery/:id';
}

final defaultAppRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.root,
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.gallery,
      builder: (_, __) => const GalleryPage(),
    ),
    GoRoute(
      path: AppRoutes.galleryItem,
      builder: (_, __) => const GalleryItemHomePage(),
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

  void navigateToGalleryItem(String itemId) {
    go(
      AppRoutes.galleryItem.replaceAll(':id', itemId),
    );
  }
}
