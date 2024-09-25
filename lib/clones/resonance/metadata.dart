// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';

import 'page.dart';

class ResonanceAppData extends GalleryItemData {
  ResonanceAppData()
      : super(
          id: 'RESO-00',
          name: 'Resonance',
          seedColor: ColorsExtended.charcoal,
          iconData: const Icon(
            FontAwesomeIcons.arrowsSpin,
            size: 16,
          ),
          description: 'TODO: Add description',
          pageBuilder: (_) => const ResonancePage(),
        );
}
