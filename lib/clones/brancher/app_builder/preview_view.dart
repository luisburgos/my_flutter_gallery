import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({
    required this.previewBodyData,
    super.key,
  });

  final PreviewBodyData previewBodyData;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.black,
        child: Column(
          children: [
            const PreviewHeader(),
            PreviewBody(data: previewBodyData),
          ],
        ),
      ),
    );
  }
}

class PreviewHeader extends StatelessWidget {
  const PreviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsExtended.white80,
      padding: const EdgeInsets.all(8),
      child: const Center(
        child: Text(
          'Preview & Test Window',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class PreviewBodyData {
  const PreviewBodyData({
    required this.title,
    required this.description,
    required this.authorName,
  });

  final String title;
  final String description;
  final String authorName;
}

class PreviewBody extends StatelessWidget {
  const PreviewBody({
    required this.data,
    super.key,
  });

  final PreviewBodyData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'by ${data.authorName}',
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data.description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
