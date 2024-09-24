import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/app_commands.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/site_top_bar/state.dart';
import 'package:my_flutter_gallery/components/site_top_bar/widgets.dart';

class DefaultSiteTopBar extends StatelessWidget {
  const DefaultSiteTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final siteTopBarState = SiteTopBarState.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 4,
      ),
      child: Row(
        children: [
          SiteTopBarTabButton(
            onPressed: () => siteTopBarState.setIndex(
              0,
              context.navigateToHome,
            ),
            isSelected: siteTopBarState.selectedIndex == 0,
            iconData: FontAwesomeIcons.house,
            text: 'HOME',
          ),
          const SizedBox(width: 8),
          SiteTopBarTabButton(
            onPressed: () => selectGalleryPage(context),
            isSelected: siteTopBarState.selectedIndex == 1,
            iconData: FontAwesomeIcons.folderOpen,
            text: 'FLUTTER GALLERY',
          ),
          /*const SizedBox(width: 8),
          SiteTopBarTabButton(
            onPressed: () => siteTopBarState.setIndex(
              2,
              context.navigateToAbout,
            ),
            isSelected: siteTopBarState.selectedIndex == 2,
            iconData: FontAwesomeIcons.user,
            text: 'ABOUT',
          ),*/
          const Spacer(),
          //const XTwitterButton(),
          const GithubButton(
            url: 'https://github.com/luisburgos',
          ),
        ],
      ),
    );
  }
}
