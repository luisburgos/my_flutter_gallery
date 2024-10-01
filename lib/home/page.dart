import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/site_top_bar/site_top_bar.dart';
import 'package:my_flutter_gallery/home/page_template.dart';
import 'package:my_flutter_gallery/home/widgets/latest_items_view.dart';
import 'package:my_flutter_gallery/home/widgets/summary_view.dart';
import 'package:my_flutter_gallery/utils/constrained_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedPage(
      child: Column(
        children: [
          DefaultSiteTopBarView(
            selectedIndex: siteTopBarHomeIndex,
            onItemPressed: (_) => defaultSiteTopBarItemPressedHandler(
              _,
              context,
            ),
          ),
          const Expanded(
            child: HomePageTemplate(
              summary: SummaryView(),
              latestItems: LatestItemsView(),
            ),
          ),
        ],
      ),
    );
  }
}
