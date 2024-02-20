import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:my_flutter_gallery/shared/dashboard_page_view.dart';
import 'package:my_flutter_gallery/shared/open_command_bar_shortcut.dart';

class SuperNotesPage extends StatelessWidget {
  const SuperNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageData = SupernotesAppData();

    return Scaffold(
      body: OpenCommandBarShortcut(
        child: DashboardPageView(
          /// App Specific
          appTitle: pageData.name,
          appLogoIcon: pageData.iconData,
          accentColor: pageData.seedColor,
          primaryColor: ColorsExtended.charcoal,

          /// Responsive Breakpoints
          smallWidthBreakpoint: 600,
          mediumWidthBreakpoint: 800,

          /// Navigation Items
          initialSelectedItemId: _homeId,
          topBarItems: [
            _profileItemData,
          ],
          bottomBarItems: [
            _homeItemData,
            _searchItemData,
            _pinnedItemData,
            _notificationsItemData,
          ],
          sideBarBodyItems: [
            _homeItemData,
            _searchItemData,
          ],
          sideBarFooterItems: [
            _notificationsItemData,
            _profileItemData,
          ],
        ),
      ),
    );
  }
}

const _homeId = 'home';
const _searchId = 'search';
const _notificationsId = 'notifications';
const _profileId = 'profile';
const _pinnedId = 'pinned';

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
  label: 'Search',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.magnifyingGlass,
    size: 16,
  ),
);
final _notificationsItemData = NavigationItemData(
  id: _notificationsId,
  label: 'Notifications',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.heart,
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
final _pinnedItemData = NavigationItemData(
  id: _pinnedId,
  label: 'Pinned',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.thumbtack,
    size: 16,
  ),
);
