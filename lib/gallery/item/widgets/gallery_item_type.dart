import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GalleryItemTypeChip extends StatelessWidget {
  const GalleryItemTypeChip({
    required this.type,
    this.padding,
    super.key,
  });

  final GalleryItemType type;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ShadBadge(
        padding: const EdgeInsets.all(6),
        //backgroundColor: const Color(0xFFECE6EE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          type.name.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            //color: ShadTheme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
