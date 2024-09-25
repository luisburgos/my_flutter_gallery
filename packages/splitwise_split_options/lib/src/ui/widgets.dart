import 'package:flutter/material.dart';

/// @no-doc
class SplitOptionIconButton extends StatelessWidget {
  /// @no-doc
  const SplitOptionIconButton({
    required this.strategyId,
    required this.strategyCoverColor,
    required this.isActive,
    required this.onTabPressed,
    super.key,
  });

  /// @no-doc
  final String strategyId;

  /// @no-doc
  final Color strategyCoverColor;

  /// @no-doc
  final bool isActive;

  /// @no-doc
  final void Function() onTabPressed;

  @override
  Widget build(BuildContext context) {
    late IconData iconData;
    switch (strategyId) {
      case 'split_equally':
        iconData = Icons.drag_handle;
      case 'split_exact_amounts':
        iconData = Icons.numbers;
      case 'split_by_percentages':
        iconData = Icons.percent;
      case 'split_by_shares':
        iconData = Icons.bar_chart_sharp;
      default:
        throw UnimplementedError('No icon for id: $strategyId');
    }

    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: IconButton.outlined(
            onPressed: onTabPressed,
            icon: Icon(
              iconData,
              color: isActive
                  ? strategyCoverColor
                  : Theme.of(context).iconTheme.color,
            ),
          ),
        );
      },
    );
  }
}
