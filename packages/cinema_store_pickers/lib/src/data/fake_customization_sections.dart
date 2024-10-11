import 'package:cinema_store_pickers/src/data/fakes_beverages.dart';
import 'package:cinema_store_pickers/src/models/customization_section.dart';
import 'package:cinema_store_pickers/src/models/item_flavor.dart';
import 'package:cinema_store_pickers/src/models/item_ice.dart';
import 'package:cinema_store_pickers/src/models/item_size.dart';
import 'package:cinema_store_pickers/src/shared/picker_models.dart';
import 'package:money2/money2.dart';

/// @no-doc
final sodaSizeSection = CustomizationSection<ItemSize>(
  id: 'soda-size-section-01',
  title: 'Elige un tamaño',
  selectionMode: CustomizationSectionSelectionMode.single,
  transformer: sizeTransformer,
  options: const [
    CustomizationSectionOption(sodaSize1),
    CustomizationSectionOption(sodaSize2),
    CustomizationSectionOption(sodaSize3),
    CustomizationSectionOption(sodaSize4),
  ],
);

/// @no-doc
typedef CustomizationSectionOptionTransformer<T> = PickerSectionOptionItemData
    Function(
  CustomizationSectionOption<T>,
);

/// @no-doc
final sodaFlavorSection = CustomizationSection<ItemFlavor>(
  id: 'soda-flavor-section-01',
  title: 'Elige un sabor',
  selectionMode: CustomizationSectionSelectionMode.single,
  transformer: flavorTransformer,
  options: const [
    CustomizationSectionOption(sodaFlavor1),
    CustomizationSectionOption(sodaFlavor2),
    CustomizationSectionOption(sodaFlavor3),
    CustomizationSectionOption(sodaFlavor4),
  ],
);

/// @no-doc
final sodaIceSection = CustomizationSection<ItemIce>(
  id: 'soda-ice-section-01',
  title: 'Elige la cantidad de hielo deseada',
  selectionMode: CustomizationSectionSelectionMode.single,
  transformer: iceTransformer,
  options: const [
    CustomizationSectionOption(itemIce1),
    CustomizationSectionOption(itemIce2),
    CustomizationSectionOption(itemIce3),
  ],
);

/// @no-doc
CustomizationSectionOptionTransformer<ItemIce> iceTransformer =
    (item) => PickerSectionOptionItemData(
          name: item.data.name,
          iconName: item.data.name,
          priceTag: '',
        );

/// @no-doc
CustomizationSectionOptionTransformer<ItemSize> sizeTransformer =
    (item) => PickerSectionOptionItemData(
          name: item.data.name,
          iconName: item.data.iconName,
          priceTag: Money.fromNum(
            item.data.price,
            isoCode: 'MXN',
            decimalDigits: 2,
          ).toString(),
        );

/// @no-doc
CustomizationSectionOptionTransformer<ItemFlavor> flavorTransformer =
    (item) => PickerSectionOptionItemData(
          name: item.data.name,
          iconName: item.data.iconName,
          priceTag: Money.fromNum(
            item.data.price,
            isoCode: 'MXN',
            decimalDigits: 2,
          ).toString(),
        );
