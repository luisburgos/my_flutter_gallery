import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:store_picker/store_picker.dart';

const primaryColor = Color(0xFF1E1E1E);
const secondaryColor = Color(0xFF757575);
const accentColor = Color(0xFF4F9FFA);

const githubUrl = 'https://github.com/luisburgos';
const galleryRepoGithubUrl = '$githubUrl/my_flutter_gallery';
const galleryRepoPackagesGithubUrl = '$galleryRepoGithubUrl/tree/main/packages';

const maxWidthConstraint = 732.0;

class StorePickersEngineData extends GalleryItemData {
  StorePickersEngineData()
      : super(
          id: 'store-pickers',
          name: 'Store Pickers Engine',
          type: GalleryItemType.component,
          seedColor: Colors.blueAccent,
          iconData: const Icon(
            FontAwesomeIcons.ticket,
            size: 16,
          ),
          description:
              'Create product variant customization pickers for any store',
          pageBuilder: (_) => const StoresPickersRootPage(),
          githubRepoUrl: '$galleryRepoPackagesGithubUrl/store_pickers_engine',
          coverBuilder: (_) => CinemaStorePickersCoverArt(colors: _),
        );
}
