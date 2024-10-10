import 'package:cinema_store_pickers/src/popcorn_picker/state.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/// @no-doc
extension CinemaBrandColor on PopcornPickerState {
  /// @no-doc
  Color getBrandColor(BuildContext context) {
    var brandColor = Theme.of(context).colorScheme.primary;
    if (brandHexColor != null) {
      brandColor = HexColor(brandHexColor!);
    }
    return brandColor;
  }
}
