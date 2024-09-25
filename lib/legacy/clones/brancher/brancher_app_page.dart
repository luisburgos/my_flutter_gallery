import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/legacy/clones/brancher/app_builder/app_builder.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:my_flutter_gallery/shared/dashboard_page_view.dart';

class BrancherAiAppPage extends StatelessWidget {
  const BrancherAiAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageData = BrancherAiAppData();

    return Scaffold(
      body: DashboardPageView(
        /// App Specific
        appTitle: pageData.name,
        appLogoIcon: pageData.iconData,
        accentColor: pageData.seedColor,
        primaryColor: ColorsExtended.charcoal,

        /// Responsive Breakpoints
        sideBarExpandedWidth: 220,
        smallWidthBreakpoint: 600,
        mediumWidthBreakpoint: 800,

        /// Navigation Items
        initialSelectedItemId: _appsId,
        topBarItems: [
          _profileItemData,
        ],
        bottomBarItems: [
          _appsItemData,
          _templateLibraryItemData,
          _subscriptionsItemData,
        ],
        sideBarBodyItems: [
          _appsItemData,
          _templateLibraryItemData,
          _subscriptionsItemData,
        ],
        sideBarFooterItems: [
          _profileItemData,
        ],
        pageBodyBuilder: (_) => const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBuilderCubit(),
      child: const AppBuilderView(),
    );
  }
}

const _appsId = 'apps';
const _templateLibraryId = 'template_library';
const _subscriptionsId = 'subscriptions';
const _profileId = 'profile';

final _appsItemData = NavigationItemData(
  id: _appsId,
  label: 'Apps',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.rocket,
    size: 16,
  ),
);
final _templateLibraryItemData = NavigationItemData(
  id: _templateLibraryId,
  label: 'Template Library',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.rectangleList,
    size: 16,
  ),
);
final _subscriptionsItemData = NavigationItemData(
  id: _subscriptionsId,
  label: 'Subscriptions',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.bolt,
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
