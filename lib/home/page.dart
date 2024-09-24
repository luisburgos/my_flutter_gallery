import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/site_top_bar/site_top_bar.dart';
import 'package:my_flutter_gallery/home/home_body.dart';
import 'package:my_flutter_gallery/utils/constrained_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConstrainedPage(
      child: Column(
        children: [
          DefaultSiteTopBar(),
          Expanded(
            child: HomeBody(),
          ),
        ],
      ),
    );
  }
}
