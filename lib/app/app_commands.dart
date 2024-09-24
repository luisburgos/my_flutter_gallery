import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/site_top_bar/site_top_bar.dart';

Future<void> selectGalleryPage(BuildContext context) async {
  final siteTopBarState = SiteTopBarState.of(context);

  siteTopBarState.setIndex(
    1,
    context.navigateToGallery,
  );
}
