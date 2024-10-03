// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';

import 'page.dart';

class LLMSelectorAppData extends GalleryItemData {
  LLMSelectorAppData()
      : super(
          id: 'LLMS-00',
          name: 'LLM Selector',
          seedColor: ColorsExtended.charcoal,
          iconData: const Icon(
            FontAwesomeIcons.clipboardList,
            size: 16,
          ),
          description: 'TODO: Add description',
          pageBuilder: (_) => const LLMSelectorPage(),
          type: GalleryItemType.component,
        );
}
