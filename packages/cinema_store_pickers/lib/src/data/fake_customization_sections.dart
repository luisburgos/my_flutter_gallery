import 'package:cinema_store_pickers/src/data/fakes_beverages.dart';
import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/models/item_flavor.dart';
import 'package:cinema_store_pickers/src/models/item_ice.dart';
import 'package:cinema_store_pickers/src/models/item_size.dart';

/// @no-doc
const sodaSizeSection = CustomizationSection<ItemSize>(
  id: 'soda-size-section-01',
  title: 'Elige un tamaño',
  selectionMode: CustomizationSectionSelectionMode.single,
  options: [
    CustomizationSectionOption(sodaSize1),
    CustomizationSectionOption(sodaSize2),
    CustomizationSectionOption(sodaSize3),
    CustomizationSectionOption(sodaSize4),
  ],
);

/// @no-doc
const sodaFlavorSection = CustomizationSection<ItemFlavor>(
  id: 'soda-flavor-section-01',
  title: 'Elige un sabor',
  selectionMode: CustomizationSectionSelectionMode.single,
  options: [
    CustomizationSectionOption(sodaFlavor1),
    CustomizationSectionOption(sodaFlavor2),
    CustomizationSectionOption(sodaFlavor3),
    CustomizationSectionOption(sodaFlavor4),
  ],
);

/// @no-doc
const sodaIceSection = CustomizationSection<ItemIce>(
  id: 'soda-ice-section-01',
  title: 'Elige la cantidad de hielo deseada',
  selectionMode: CustomizationSectionSelectionMode.single,
  options: [
    CustomizationSectionOption(itemIce1),
    CustomizationSectionOption(itemIce2),
    CustomizationSectionOption(itemIce3),
  ],
);
