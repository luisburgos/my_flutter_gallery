import 'package:cinema_store_pickers/src/pickomatic/pickomatic_item.dart';

/// @no-doc
class StoreItem2 {
  /// @no-doc
  const StoreItem2({
    required this.id,
    required this.name,
    required this.possibleSizes,
    required this.possibleVariants,
    required this.availableVariantsBySize,
    required this.variantPriceBySize,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String name;

  /// @no-doc
  final List<PickOMaticItem> possibleSizes;

  /// @no-doc
  final List<PickOMaticItem> possibleVariants;

  /// @no-doc
  final Map<PickOMaticItemId, List<PickOMaticItemId>> availableVariantsBySize;

  /// @no-doc
  final Map<PickOMaticItemId, Map<PickOMaticItemId, double>> variantPriceBySize;

  /// @no-doc
  double getAttributePrice(
    PickOMaticItemId variantId,
    PickOMaticItemId sizeId,
  ) {
    return variantPriceBySize[variantId]?[sizeId] ?? 0.0;
  }

  /// @no-doc
  bool isColorAvailableForSize(
    PickOMaticItemId variantId,
    PickOMaticItemId sizeId,
  ) {
    return availableVariantsBySize[sizeId]?.contains(variantId) ?? false;
  }

  /// @no-doc
  @override
  String toString() => id;
}

/// @no-doc
class StoreItem {
  /// @no-doc
  const StoreItem({
    required this.id,
    required this.name,
    required this.possibleSizes,
    required this.possibleVariants,
    required this.availableVariantsBySize,
    required this.variantPriceBySize,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String name;

  /// @no-doc
  final List<PickOMaticItem> possibleSizes;

  /// @no-doc
  final List<PickOMaticItem> possibleVariants;

  /// @no-doc
  final Map<PickOMaticItemId, List<PickOMaticItemId>> availableVariantsBySize;

  /// @no-doc
  final Map<PickOMaticItemId, Map<PickOMaticItemId, double>> variantPriceBySize;

  /// @no-doc
  double getAttributePrice(
    PickOMaticItemId variantId,
    PickOMaticItemId sizeId,
  ) {
    return variantPriceBySize[variantId]?[sizeId] ?? 0.0;
  }

  /// @no-doc
  bool isColorAvailableForSize(
    PickOMaticItemId variantId,
    PickOMaticItemId sizeId,
  ) {
    return availableVariantsBySize[sizeId]?.contains(variantId) ?? false;
  }

  /// @no-doc
  @override
  String toString() => id;
}
