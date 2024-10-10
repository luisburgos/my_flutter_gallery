import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// @no-doc
abstract class LayoutGridCalculations {
  /// @no-doc
  int get itemCount;

  /// @no-doc
  int get crossAxisCount;

  /// @no-doc
  (double, double) get gaps;

  /// @no-doc
  (List<TrackSize>, List<TrackSize>) get sizes;
}

/// @no-doc
class SimpleLayoutGridCalculations implements LayoutGridCalculations {
  /// @no-doc
  const SimpleLayoutGridCalculations({
    required this.itemCount,
    required this.crossAxisCount,
  });

  @override
  final int itemCount;
  @override
  final int crossAxisCount;

  @override
  (double, double) get gaps => (8, 8);

  @override
  (List<TrackSize>, List<TrackSize>) get sizes {
    var columnSizes = <FlexibleTrackSize>[];
    for (var i = 0; i < crossAxisCount; i++) {
      columnSizes = [...columnSizes, 1.fr];
    }

    var rowSizes = <IntrinsicContentTrackSize>[];
    for (var i = 0; i < itemCount / crossAxisCount; i++) {
      rowSizes = [...rowSizes, auto];
    }
    return (columnSizes, rowSizes);
  }
}
