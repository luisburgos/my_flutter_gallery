import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemBrief extends StatelessWidget {
  const GalleryItemBrief({
    required this.name,
    required this.description,
    this.padding,
    super.key,
  });

  final String name;
  final String description;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final subtitleColor = ShadTheme.of(context).colorScheme.mutedForeground;

    return Padding(
      padding: padding ?? const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            maxLines: 3,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: subtitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
