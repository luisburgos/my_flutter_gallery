import 'package:cinema_store_pickers/src/popcorn_picker/models.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/widgets/cinema_branch_selector.dart';
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
    final popcornPicker = ref.watch(popcornPickerNotifierProvider);
    final theme = Theme.of(context);
    final brandColor = theme.colorScheme.primary;
    if (popcornPicker.brandHexColor != null) {
      //brandColor = hexToColor(popcornFlavorPicker.brandHexColor!);
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CinemaBranchSelector(
              options: popcornPicker.cinemaOptions,
              selectedCinema: popcornPicker.selectedCinema!,
              onSetSelectedCinema: (_) {
                ref
                    .read(popcornPickerNotifierProvider.notifier)
                    .setSelectedCinemaBranch(_.id);
              },
              color: brandColor,
            ),
          ),
          PickerTitle(
            selectionLimit: popcornPicker.selectionLimit,
            color: brandColor,
          ),
          SizedBox(
            height: 100,
            child: PickerPreview(
              items: popcornPicker.selected,
              onRemoveTap: ref
                  .read(popcornPickerNotifierProvider.notifier)
                  .toggleSelected,
            ),
          ),
          SizedBox(
            height: 300,
            child: PickerOptions(
              items: popcornPicker.options,
              selectedItems: popcornPicker.selected,
              onOptionTap: ref
                  .read(popcornPickerNotifierProvider.notifier)
                  .toggleSelected,
              selectedColor: brandColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// @no-doc
class PickerTitle extends StatelessWidget {
  /// @no-doc
  const PickerTitle({
    required this.color,
    required this.selectionLimit,
    super.key,
  });

  /// @no-doc
  final Color color;

  /// @no-doc
  final int selectionLimit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 8,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Elige hasta $selectionLimit sabores para tus palomitas',
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// @no-doc
class PickerPreview extends StatelessWidget {
  /// @no-doc
  const PickerPreview({
    required this.items,
    required this.onRemoveTap,
    super.key,
  });

  final List<PopcornFlavorOption> items;
  final void Function(PopcornFlavorOption) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        color: Colors.grey.shade300,
        width: double.infinity,
        height: 20,
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: items.isEmpty ? 1 : items.length,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 12 / items.length,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PickerPreviewItem(
          item: items[index],
          onRemoveTap: onRemoveTap,
          displayRemoveButton: items.length > 1,
        );
      },
    );
  }
}

/// @no-doc
class PickerPreviewItem extends StatelessWidget {
  /// @no-doc
  const PickerPreviewItem({
    required this.item,
    required this.onRemoveTap,
    this.displayRemoveButton = true,
    super.key,
  });

  final PopcornFlavorOption item;
  final bool displayRemoveButton;
  final void Function(PopcornFlavorOption) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.secondary.withAlpha(30),
      child: Stack(
        children: [
          Center(
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          if (displayRemoveButton)
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () => onRemoveTap(item),
              ),
            ),
        ],
      ),
    );
  }
}

/// @no-doc
class PickerOptions extends StatelessWidget {
  /// @no-doc
  const PickerOptions({
    required this.items,
    required this.selectedItems,
    required this.onOptionTap,
    required this.selectedColor,
    super.key,
  });

  /// @no-doc
  final List<PopcornFlavorOption> items;

  /// @no-doc
  final List<PopcornFlavorOption> selectedItems;

  /// @no-doc
  final void Function(PopcornFlavorOption) onOptionTap;

  /// @no-doc
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 6,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return PickerOptionItem(
          item: item,
          onOptionTap: onOptionTap,
          isSelected: selectedItems.contains(item),
          selectedColor: selectedColor,
        );
      },
    );
  }
}

/// @no-doc
class PickerOptionItem extends StatelessWidget {
  /// @no-doc
  const PickerOptionItem({
    required this.item,
    required this.onOptionTap,
    required this.isSelected,
    required this.selectedColor,
    super.key,
  });

  /// @no-doc
  final PopcornFlavorOption item;

  /// @no-doc
  final bool isSelected;

  /// @no-doc
  final void Function(PopcornFlavorOption) onOptionTap;

  /// @no-doc
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onOptionTap(item),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? selectedColor : Colors.grey,
          ),
        ),
        width: 20,
        height: 20,
        child: Center(
          child: Text(
            item.name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
