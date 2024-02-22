import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/chat_history_view.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/dialogs/dialogs.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/new_chat_body.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:my_flutter_gallery/shared/dashboard_page_view.dart';
import 'package:my_flutter_gallery/shared/open_launchpad_shortcut.dart';

class OpenGptChatUiPage extends StatelessWidget {
  const OpenGptChatUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageData = OpenGptChatUiAppData();

    return Scaffold(
      body: OpenLaunchpadShortcut(
        child: DashboardPageView(
          /// App Specific
          appTitle: pageData.name,
          appLogoIcon: pageData.iconData,
          accentColor: pageData.seedColor,
          primaryColor: ColorsExtended.charcoal,
          // TODO(unassigned): fix hiding title breaks [topBarItems] alignment
          displayAppTitle: false,

          /// Responsive Breakpoints
          sideBarExpandedWidth: 280,
          mediumWidthBreakpoint: 900,
          smallWidthBreakpoint: 550,

          /// Navigation Items
          initialSelectedItemId: _newChatId,
          topBarItems: [
            _newChatItemData,
          ],
          sideBarBodyItems: [
            _newChatItemData,
          ],
          sideBarHeaderBuilder: (isCollapsed) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                children: [
                  NavigationItemView(
                    data: _newChatItemData,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    // TODO(unassigned): avoid duplication, evaluate design
                    config: NavigationItemsConfig(
                      isCollapsed: isCollapsed,
                      fillWidth: true,
                      iconDefaultColor: pageData.seedColor,
                      iconDefaultAccentColor: ColorsExtended.charcoal,
                    ),
                    onPressed: () {},
                    // TODO(unassigned): remove, make it optional or refactor
                    selectedItemId: '',
                  ),
                ],
              ),
            );
          },
          sideBarBodyBuilder: () {
            return const ChatHistoryView();
          },
          sideBarFooterItems: [
            _renewPlusItemData,
            _profileItemData,
          ],
          onSelectedItemId: (_) {
            if (_ == _renewPlusId) {
              openDialog(
                context,
                child: const UpgradeYourPlanDialog(),
              );
              return;
            }
          },
          pageBodyBuilder: (_) {
            return const NewChatBody();
            //return const ChatBody();
          },
        ),
      ),
    );
  }
}

const _newChatId = 'new_chat';
const _profileId = 'profile';
const _renewPlusId = 'renew';

final _newChatItemData = NavigationItemData(
  id: _newChatId,
  label: 'New Chat',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.penToSquare,
    size: 16,
  ),
);
final _renewPlusItemData = NavigationItemData(
  id: _renewPlusId,
  label: 'Renew Plus',
  iconBuilder: (_) => const Icon(
    FontAwesomeIcons.wandSparkles,
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
