// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';

import 'page.dart';

class MyAppData extends GalleryItemData {
  MyAppData()
      : super(
          id: 'XXXX-00',
          name: 'Base',
          seedColor: ColorsExtended.charcoal,
          iconData: const Icon(
            FontAwesomeIcons.clone,
            size: 16,
          ),
          description: 'TODO: Add description',
          pageBuilder: (_) => const MyPage(),
        );
}
