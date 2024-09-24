import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_gallery/app/app.dart';
import 'package:my_flutter_gallery/gallery/page.dart';
import 'package:my_flutter_gallery/home/page.dart';
import 'package:my_flutter_gallery/home/site_top_bar.dart';

class AppRoutes {
  static const root = '/';
  static const gallery = '/gallery';
  static const about = '/about';
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
    GoRoute(
      path: AppRoutes.about,
      builder: (_, __) => const Scaffold(
        body: Column(
          children: [
            SiteTopBarView(),
            Expanded(
              child: Center(
                child: Text('About WIP'),
              ),
            ),
          ],
        ),
      ),
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
}
