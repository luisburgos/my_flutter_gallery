import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/legacy/clones/brancher/brancher_app_page.dart';
import 'package:my_flutter_gallery/legacy/clones/habits/habits.dart';
import 'package:my_flutter_gallery/legacy/clones/instagram/instagram_app_page.dart';
import 'package:my_flutter_gallery/legacy/clones/open_gpt_chat_ui/open_gpt_chat_ui_page.dart';
import 'package:my_flutter_gallery/legacy/clones/perplexity/perplexity_app_page.dart';
import 'package:my_flutter_gallery/legacy/clones/popcorn_flavor_picker/popcorn_flavor_picker_page.dart';
import 'package:my_flutter_gallery/legacy/clones/supernotes/supernotes_app_page.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:readwise_daily_review/readwise_daily_review.dart';
import 'package:roadie/roadie.dart';
import 'package:splitwise_split_options/splitwise_split_options.dart';

const primaryColor = Color(0xFF1E1E1E);
const secondaryColor = Color(0xFF757575);
const accentColor = Color(0xFF4F9FFA);

const githubUrl = 'https://github.com/luisburgos';
const galleryRepoGithubUrl = '$githubUrl/my_flutter_gallery';
const galleryRepoPackagesGithubUrl = '$galleryRepoGithubUrl/tree/main/packages';

const maxWidthConstraint = 732.0;

const gLoremDescription = 'TODO: Add description lorem ipsum description '
    'lorem ipsum description '
    'lorem ipsum description';

class InstagramAppData extends GalleryItemData {
  InstagramAppData()
      : super(
          id: 'INST-00',
          name: 'Instagram',
          type: GalleryItemType.feature,
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
          type: GalleryItemType.feature,
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
          type: GalleryItemType.feature,
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
          type: GalleryItemType.feature,
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
          type: GalleryItemType.feature,
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
          type: GalleryItemType.feature,
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
          type: GalleryItemType.feature,
          seedColor: Colors.orange,
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
          id: 'RWDR-00',
          name: 'Readwise Daily Review',
          type: GalleryItemType.feature,
          seedColor: Colors.blueGrey,
          iconData: const Icon(
            FontAwesomeIcons.readme,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const ReadwiseDailyReviewPage(),
          githubRepoUrl: '$galleryRepoPackagesGithubUrl/readwise_daily_review',
        );
}

class SplitwiseSplitOptions extends GalleryItemData {
  SplitwiseSplitOptions()
      : super(
          id: 'SWSP-00',
          name: 'Splitwise Split Options',
          type: GalleryItemType.feature,
          seedColor: Colors.greenAccent,
          iconData: const Icon(
            FontAwesomeIcons.arrowsSplitUpAndLeft,
            size: 16,
          ),
          description: gLoremDescription,
          pageBuilder: (_) => const SplitOptionsPage(),
          githubRepoUrl:
              '$galleryRepoPackagesGithubUrl/splitwise_split_options',
        );
}

class RoadieAppItemData extends GalleryItemData {
  RoadieAppItemData()
      : super(
          id: 'ROAD-00',
          name: 'Roadie: Course to App',
          type: GalleryItemType.feature,
          seedColor: Colors.deepOrange,
          iconData: const Icon(
            FontAwesomeIcons.spa,
            size: 16,
          ),
          description: 'Easily transform any course contents into '
              'a companion app.\nGo from zero to '
              'hero with interactive lessons',
          pageBuilder: (_) => const RoadieApp(
            child: RoadieMainPage(),
          ),
          githubRepoUrl: '$galleryRepoPackagesGithubUrl/roadie',
        );
}
