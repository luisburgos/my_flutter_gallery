import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/site_top_bar/site_top_bar.dart';
import 'package:my_flutter_gallery/gallery/widgets/gallery_view.dart';
import 'package:my_flutter_gallery/utils/constrained_page.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConstrainedPage(
      child: Column(
        children: [
          DefaultSiteTopBar(),
          Expanded(
            child: GalleryView(),
          ),
        ],
      ),
    );
  }
}
