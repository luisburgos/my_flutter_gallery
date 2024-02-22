import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';

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
        );
}
