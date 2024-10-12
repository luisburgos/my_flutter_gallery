import 'package:cinema_store_pickers/src/cinemas/state.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/// @no-doc
extension CinemaBrandColor on CinemaStoreState {
  /// @no-doc
  Color getBrandColor(BuildContext context) {
    var brandColor = Theme.of(context).colorScheme.primary;
    if (brandHexColor != null) {
      brandColor = HexColor(brandHexColor!);
    }
    return brandColor;
  }
}
