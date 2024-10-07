import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/state.dart';

class MyFlutterGallery extends StatefulWidget {
  const MyFlutterGallery({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<MyFlutterGallery> createState() => _MyFlutterGalleryState();
}

class _MyFlutterGalleryState extends State<MyFlutterGallery> {
  final _items = <GalleryItemData>[
    //InstagramAppData(),
    //PerplexityAppData(),
    //SupernotesAppData(),
    BrancherAiAppData(),
    //OpenGptChatUiAppData(),
    PopcornFlavorPickerData(),
    HabitsData(),
    SplitwiseSplitOptions(),
    ReadwiseDailyReview(),
    //RoadieAppItemData(),
    //ResonanceAppData(),
    //LLMSelectorAppData(),
    //OpenAiUiData(),
  ];

  @override
  Widget build(BuildContext context) {
    return GalleryItemsState(
      items: _items,
      child: widget.child,
    );
  }
}
