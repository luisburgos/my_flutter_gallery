import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/clones/brancher/brancher_app_page.dart';
import 'package:my_flutter_gallery/clones/habits/habits.dart';
import 'package:my_flutter_gallery/clones/instagram/instagram_app_page.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/open_gpt_chat_ui_page.dart';
import 'package:my_flutter_gallery/clones/perplexity/perplexity_app_page.dart';
import 'package:my_flutter_gallery/clones/popcorn_flavor_picker/popcorn_flavor_picker_page.dart';
import 'package:my_flutter_gallery/clones/supernotes/supernotes_app_page.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:readwise_daily_review/readwise_daily_review.dart';

const gLoremDescription = 'TODO: Add description lorem ipsum description '
    'lorem ipsum description '
    'lorem ipsum description';

class InstagramAppData extends GalleryItemData {
  InstagramAppData()
      : super(
          id: 'INST-00',
          name: 'Instagram',
          seedColor: ColorsExtended.instaOrange,
          iconData: const Icon(
            FontAwesomeIcons.instagram,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const InstagramPage(),
        );
}

class PerplexityAppData extends GalleryItemData {
  PerplexityAppData()
      : super(
          id: 'PERP-00',
          name: 'Perplexity',
          seedColor: Colors.cyan,
          iconData: const Icon(
            FontAwesomeIcons.microchip,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const PerplexityPage(),
        );
}

class SupernotesAppData extends GalleryItemData {
  SupernotesAppData()
      : super(
          id: 'SUPN-00',
          name: 'Supernotes',
          seedColor: Colors.pinkAccent,
          iconData: const Icon(
            FontAwesomeIcons.noteSticky,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const SuperNotesPage(),
        );
}

class BrancherAiAppData extends GalleryItemData {
  BrancherAiAppData()
      : super(
          id: 'BRCR-00',
          name: 'brancher.ai',
          seedColor: Colors.green,
          iconData: const Icon(
            FontAwesomeIcons.wind,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const BrancherAiAppPage(),
        );
}

class OpenGptChatUiAppData extends GalleryItemData {
  OpenGptChatUiAppData()
      : super(
          id: 'OGTC-00',
          name: 'OpenGPTChatUI',
          seedColor: Colors.green,
          iconData: const Icon(
            FontAwesomeIcons.message,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const OpenGptChatUiPage(),
        );
}

class PopcornFlavorPickerData extends GalleryItemData {
  PopcornFlavorPickerData()
      : super(
          id: 'POPP-00',
          name: 'PopcornFlavorPicker',
          seedColor: Colors.blueAccent,
          iconData: const Icon(
            FontAwesomeIcons.film,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const PopcornFlavorPickerPage(),
        );
}

class HabitsData extends GalleryItemData {
  HabitsData()
      : super(
          id: 'HABI-00',
          name: 'Habits',
          seedColor: Colors.lightGreenAccent,
          iconData: const Icon(
            FontAwesomeIcons.calendarWeek,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const HabitsPage(),
        );
}

class ReadwiseDailyReview extends GalleryItemData {
  ReadwiseDailyReview()
      : super(
          id: 'READ-00',
          name: 'Readwise Daily Review',
          seedColor: Colors.blueGrey,
          iconData: const Icon(
            FontAwesomeIcons.readme,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const ReadwiseDailyReviewPage(),
        );
}
