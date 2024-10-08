import 'package:cinema_store_pickers/src/popcorn_picker/models.dart';
import 'package:cinema_store_pickers/src/popcorn_picker/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopcornPickerWidget extends ConsumerStatefulWidget {
  @override
  _PopcornPickerWidgetState createState() => _PopcornPickerWidgetState();
}

class _PopcornPickerWidgetState extends ConsumerState<PopcornPickerWidget> {
  @override
  void initState() {
    ref.read(popcornFlavorPickerNotifierProvider.notifier).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final popcornFlavorPicker = ref.watch(popcornFlavorPickerNotifierProvider);
    final theme = Theme.of(context);
    var brandColor = theme.colorScheme.primary;
    if (popcornFlavorPicker.brandHexColor != null) {
      //brandColor = hexToColor(popcornFlavorPicker.brandHexColor!);
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: PickerDataSourceSelector(
              color: brandColor,
            ),
          ),
          PickerTitle(
            selectionLimit: popcornFlavorPicker.selectionLimit,
            color: brandColor,
          ),
          SizedBox(
            height: 100,
            child: PickerPreview(
              items: popcornFlavorPicker.selected,
              onRemoveTap: ref
                  .read(popcornFlavorPickerNotifierProvider.notifier)
                  .toggleSelected,
            ),
          ),
          SizedBox(
            height: 300,
            child: PickerOptions(
              items: popcornFlavorPicker.options,
              selectedItems: popcornFlavorPicker.selected,
              onOptionTap: ref
                  .read(popcornFlavorPickerNotifierProvider.notifier)
                  .toggleSelected,
              selectedColor: brandColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PickerDataSourceSelector extends ConsumerWidget {
  const PickerDataSourceSelector({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popcornFlavorPicker = ref.watch(popcornFlavorPickerNotifierProvider);

    if (popcornFlavorPicker.cinemaOptions.isEmpty)
      return const CircularProgressIndicator();

    final segmentedCinemaOptions = {
      for (final option in popcornFlavorPicker.cinemaOptions)
        option: Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Cinema $option'),
        ),
    };

    return CupertinoSegmentedControl(
      padding: const EdgeInsets.all(8),
      groupValue: popcornFlavorPicker.selectedCinema,
      selectedColor: color,
      borderColor: color,
      children: segmentedCinemaOptions,
      onValueChanged: (_) {
        ref
            .read(popcornFlavorPickerNotifierProvider.notifier)
            .setSelectedCinema(_);
      },
    );
  }
}

class PickerTitle extends StatelessWidget {
  const PickerTitle({
    required this.color,
    required this.selectionLimit,
    super.key,
  });

  final Color color;
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

class PickerPreview extends StatelessWidget {
  const PickerPreview({
    required this.items,
    required this.onRemoveTap,
    super.key,
  });

  final List<PopcornFlavor> items;
  final void Function(PopcornFlavor) onRemoveTap;

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

class PickerPreviewItem extends StatelessWidget {
  const PickerPreviewItem({
    required this.item,
    required this.onRemoveTap,
    this.displayRemoveButton = true,
    super.key,
  });

  final PopcornFlavor item;
  final bool displayRemoveButton;
  final void Function(PopcornFlavor) onRemoveTap;

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

class PickerOptions extends StatelessWidget {
  const PickerOptions({
    required this.items,
    required this.selectedItems,
    required this.onOptionTap,
    required this.selectedColor,
    super.key,
  });

  final List<PopcornFlavor> items;
  final List<PopcornFlavor> selectedItems;
  final void Function(PopcornFlavor) onOptionTap;
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

class PickerOptionItem extends StatelessWidget {
  const PickerOptionItem({
    required this.item,
    required this.onOptionTap,
    required this.isSelected,
    required this.selectedColor,
    super.key,
  });

  final PopcornFlavor item;
  final bool isSelected;
  final void Function(PopcornFlavor) onOptionTap;
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
