import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// @no-doc
IconData faIconNameMapping(String iconName) {
  if (iconName == 'cheese') return FontAwesomeIcons.cheese;
  if (iconName == 'butter') return FontAwesomeIcons.squarePlus;
  if (iconName == 'caramel') return FontAwesomeIcons.candyCane;
  if (iconName == 'stick') return FontAwesomeIcons.personCane;
  if (iconName == 'blue_stick') return FontAwesomeIcons.stickerMule;
  return FontAwesomeIcons.ticket;
}
