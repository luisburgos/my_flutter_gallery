import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/gallery/widgets/gallery_view.dart';
import 'package:my_flutter_gallery/home/page_template.dart';
import 'package:my_flutter_gallery/home/widgets/footer.dart';
import 'package:my_flutter_gallery/home/widgets/summary_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageTemplate(
      header: SummaryView(),
      body: GalleryView(),
      footer: HomePageFooter(),
    );
  }
}
