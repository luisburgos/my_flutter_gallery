// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';

import 'page.dart';

class OpenAiUiData extends GalleryItemData {
  OpenAiUiData()
      : super(
          id: 'AIUI-00',
          name: 'AI UI',
          seedColor: Colors.deepOrangeAccent,
          iconData: const Icon(
            FontAwesomeIcons.hand,
            size: 16,
          ),
          description: 'TODO: Add description',
          pageBuilder: (_) => const OpenAiUiPage(),
          type: GalleryItemType.feature,
        );
}
