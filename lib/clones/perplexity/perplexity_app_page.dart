import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:my_flutter_gallery/shared/dashboard_page_view.dart';
import 'package:my_flutter_gallery/shared/open_launchpad_shortcut.dart';

class PerplexityPage extends StatelessWidget {
  const PerplexityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageData = PerplexityAppData();

    return Scaffold(
      body: OpenLaunchpadShortcut(
        child: DashboardPageView(
          /// App Specific
          appTitle: pageData.name,
          appLogoIcon: pageData.iconData,
          accentColor: pageData.seedColor,
          primaryColor: ColorsExtended.charcoal,

          /// Responsive Breakpoints
          mediumWidthBreakpoint: 900,
          smallWidthBreakpoint: 550,

          /// Navigation Items
          initialSelectedItemId: _homeId,
          topBarItems: [
            _profileItemData,
          ],
          bottomBarItems: [
            _homeItemData,
            _searchItemData,
            _libraryItemData,
          ],
          sideBarBodyItems: [
            _homeItemData,
            _searchItemData,
            _libraryItemData,
          ],
          sideBarFooterItems: [
            _profileItemData,
          ],
        ),
      ),
    );
  }
}

const _homeId = 'home';
const _searchId = 'search';
const _libraryId = 'library';
const _profileId = 'profile';

final _homeItemData = NavigationItemData(
  id: _homeId,
  label: 'Home',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.house,
    size: 16,
  ),
);
final _searchItemData = NavigationItemData(
  id: _searchId,
  label: 'Discover',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.magnifyingGlass,
    size: 16,
  ),
);
final _libraryItemData = NavigationItemData(
  id: _libraryId,
  label: 'Library',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.cube,
    size: 16,
  ),
);
final _profileItemData = NavigationItemData(
  id: _profileId,
  label: 'Profile',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.solidUser,
    size: 16,
  ),
);
