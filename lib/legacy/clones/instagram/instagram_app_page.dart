import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:my_flutter_gallery/shared/dashboard_page_view.dart';

class InstagramPage extends StatelessWidget {
  const InstagramPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageData = InstagramAppData();

    return Scaffold(
      body: DashboardPageView(
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
          _notificationsItemData,
        ],
        bottomBarItems: [
          _homeItemData,
          _exploreItemData,
          _createItemData,
          _messagesItemData,
          _profileItemData,
        ],
        sideBarBodyItems: [
          _homeItemData,
          _searchItemData,
          _exploreItemData,
          _notificationsItemData,
          _createItemData,
          _profileItemData,
        ],
        sideBarFooterItems: [
          _threadsItemData,
          _moreItemData,
        ],
      ),
    );
  }
}

const _homeId = 'home';
const _searchId = 'search';
const _exploreId = 'explore';
const _messagesId = 'messages';
const _notificationsId = 'notifications';
const _createId = 'create';
const _profileId = 'profile';
const _threadsId = 'threads';
const _moreIconId = 'more';

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
final _exploreItemData = NavigationItemData(
  id: _exploreId,
  label: 'Explore',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.compass,
    size: 16,
  ),
);
final _messagesItemData = NavigationItemData(
  id: _messagesId,
  label: 'Messages',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.message,
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
final _createItemData = NavigationItemData(
  id: _createId,
  label: 'Create',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.squarePlus,
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
final _threadsItemData = NavigationItemData(
  id: _threadsId,
  label: 'Threads',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.threads,
    size: 16,
  ),
);
final _moreItemData = NavigationItemData(
  id: _moreIconId,
  label: 'More',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.bars,
    size: 16,
  ),
);
