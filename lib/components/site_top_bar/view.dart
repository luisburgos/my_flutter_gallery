import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/app_commands.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/site_top_bar/state.dart';
import 'package:my_flutter_gallery/components/site_top_bar/widgets.dart';

const siteTopBarHomeIndex = 0;
const siteTopBarGalleryIndex = 1;

class DefaultSiteTopBar extends StatelessWidget {
  const DefaultSiteTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final siteTopBarState = SiteTopBarState.of(context);

    return DefaultSiteTopBarView(
      selectedIndex: siteTopBarState.selectedIndex,
      onItemPressed: (index) {
        if (index == siteTopBarHomeIndex) {
          siteTopBarState.setIndex(
            siteTopBarHomeIndex,
            context.navigateToHome,
          );
        }

        if (index == siteTopBarGalleryIndex) {
          selectGalleryPage(context);
        }
      },
    );
  }
}

void defaultSiteTopBarItemPressedHandler(
  int index,
  BuildContext context,
) {
  switch (index) {
    case siteTopBarHomeIndex:
      context.navigateToHome();
    case siteTopBarGalleryIndex:
      context.navigateToGallery();
    default:
      break;
  }
}

class DefaultSiteTopBarView extends StatelessWidget {
  const DefaultSiteTopBarView({
    required this.selectedIndex,
    required this.onItemPressed,
    super.key,
  });

  final int selectedIndex;
  final void Function(int) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return SiteTopBarContainer(
      children: [
        SiteTopBarTabButton(
          onPressed: () => onItemPressed(siteTopBarHomeIndex),
          isSelected: selectedIndex == siteTopBarHomeIndex,
          iconData: FontAwesomeIcons.house,
          text: 'HOME',
        ),
        const SizedBox(width: 8),
        SiteTopBarTabButton(
          onPressed: () => onItemPressed(siteTopBarGalleryIndex),
          isSelected: selectedIndex == siteTopBarGalleryIndex,
          iconData: FontAwesomeIcons.folderOpen,
          text: 'GALLERY',
        ),
        const Spacer(),
        const SocialButtons(),
      ],
    );
  }
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        //const XTwitterButton(),
        GithubButton(
          url: 'https://github.com/luisburgos',
        ),
      ],
    );
  }
}

class SiteTopBarContainer extends StatelessWidget {
  const SiteTopBarContainer({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 4,
      ),
      child: Row(
        children: children,
      ),
    );
  }
}
