import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/shared/trailing_icon_text_button.dart';

class SelectedModelButton extends StatelessWidget {
  const SelectedModelButton({
    required this.selectedModelName,
    required this.onPressed,
    super.key,
  });

  final String selectedModelName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return TrailingIconTextButton(
      label: selectedModelName,
      icon: const Icon(
        FontAwesomeIcons.chevronDown,
        size: 12,
      ),
      color: primary,
      onPressed: onPressed,
    );
  }
}
