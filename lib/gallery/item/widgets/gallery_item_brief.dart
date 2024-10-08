import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/globals.dart';

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
    return Padding(
      padding: padding ?? const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GalleryItemNameText(name),
          const SizedBox(height: 4),
          GalleryItemDescriptionText(
            description,
          ),
        ],
      ),
    );
  }
}

class GalleryItemDescriptionText extends StatelessWidget {
  const GalleryItemDescriptionText(
    this.description, {
    super.key,
    this.minHeight = 80.0,
    this.padding,
    this.fontSize = 12,
  });

  final String description;
  final double minHeight;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red.withOpacity(0.5),
      padding: padding,
      constraints: BoxConstraints(
        minHeight: minHeight,
      ),
      child: Text(
        description,
        //maxLines: 4,
        //textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: secondaryColor,
        ),
      ),
    );
  }
}

class GalleryItemNameText extends StatelessWidget {
  const GalleryItemNameText(
    this.name, {
    super.key,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
  });

  final String name;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
