import 'package:cinema_store_pickers/src/popcorn_picker/components/components.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/popcorn_picker_cta.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/components/popcorn_picker_title.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class PopcornPickerWidget extends ConsumerStatefulWidget {
  /// @no-doc
  const PopcornPickerWidget({super.key});

  @override
  PopcornPickerWidgetState createState() => PopcornPickerWidgetState();
}

/// @no-doc
class PopcornPickerWidgetState extends ConsumerState<PopcornPickerWidget> {
  @override
  void initState() {
    ref.read(popcornPickerNotifierProvider.notifier).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CinemaBranchSelector(),
                ),
                SliverToBoxAdapter(
                  child: PopcornPickerTitle(),
                ),
                SliverToBoxAdapter(
                  child: PopcornSizeSelector(),
                ),
                SliverToBoxAdapter(
                  child: PopcornFlavorSelector(),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(12),
          child: PopcornPickerCta(),
        )
      ],
    );
  }
}
