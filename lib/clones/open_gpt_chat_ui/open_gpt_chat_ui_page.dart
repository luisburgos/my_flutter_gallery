import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/chat/chat_details.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/chat/chat_history_view.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/chat/new_chat_body.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/dialogs/dialogs.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:my_flutter_gallery/shared/dashboard_page_view.dart';
import 'package:my_flutter_gallery/shared/open_launchpad_shortcut.dart';
import 'package:my_flutter_gallery/shared/trailing_icon_text_button.dart';

class OpenGptChatUiPage extends StatelessWidget {
  const OpenGptChatUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageData = OpenGptChatUiAppData();

    return Scaffold(
      body: OpenLaunchpadShortcut(
        child: SelectedChatWrapper(
          builder: (selectedChat, setSelectedChat) {
            return DashboardPageView(
              /// App Specific
              appTitle: pageData.name,
              appLogoIcon: pageData.iconData,
              accentColor: pageData.seedColor,
              primaryColor: ColorsExtended.charcoal,
              // TODO(unassigned): fix hiding title breaks [topBarItems] alignment
              displayAppTitle: false,

              /// Responsive Breakpoints
              sideBarExpandedWidth: 280,
              smallWidthBreakpoint: 700,

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
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      TrailingIconTextButton(
                        label: 'New Chat',
                        fontSize: 16,
                        icon: _newChatIcon,
                        color: pageData.seedColor,
                        onPressed: () => setSelectedChat(null),
                      ),
                    ],
                  ),
                );
              },
              sideBarBodyBuilder: () {
                return ChatHistoryView(
                  onItemTap: setSelectedChat,
                );
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
                if (selectedChat != null) {
                  return ChatDetailsView(content: selectedChat);
                }
                return const NewChatView();
              },
            );
          },
        ),
      ),
    );
  }
}

class SelectedChatWrapper extends StatefulWidget {
  const SelectedChatWrapper({
    required this.builder,
    super.key,
  });

  final Widget Function(String?, void Function(String?)) builder;

  @override
  State<SelectedChatWrapper> createState() => _SelectedChatWrapperState();
}

class _SelectedChatWrapperState extends State<SelectedChatWrapper> {
  String? selectedChat;

  @override
  Widget build(BuildContext context) {
    return widget.builder(selectedChat, _setSelectedChat);
  }

  void _setSelectedChat(String? chatName) {
    setState(() {
      selectedChat = chatName;
    });
  }
}

const _newChatId = 'new_chat';
const _profileId = 'profile';
const _renewPlusId = 'renew';

const _newChatIcon = Icon(
  FontAwesomeIcons.penToSquare,
  size: 16,
);
final _newChatItemData = NavigationItemData(
  id: _newChatId,
  label: 'New Chat',
  iconBuilder: (_) => _newChatIcon,
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
