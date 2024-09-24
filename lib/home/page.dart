import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/home/home_body.dart';
import 'package:my_flutter_gallery/home/site_top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SiteTopBar(
            onGalleryTap: () {
              context.navigateToGallery();
            },
            onHomeTap: () {},
          ),
          const Expanded(
            child: HomeBody(),
          ),
        ],
      ),
    );
  }
}
