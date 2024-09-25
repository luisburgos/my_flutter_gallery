import 'package:flutter/material.dart';

class SplitOptionIconButton extends StatelessWidget {
  const SplitOptionIconButton({
    required this.strategyId,
    required this.strategyCoverColor,
    required this.isActive,
    required this.onTabPressed,
    super.key,
  });

  final String strategyId;
  final Color strategyCoverColor;
  final bool isActive;
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
