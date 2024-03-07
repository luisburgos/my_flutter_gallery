import 'package:flutter/material.dart';

class WeekHeader extends StatelessWidget {
  const WeekHeader({
    required this.weekNumber,
    required this.onNextTap,
    required this.onPreviousTap,
    super.key,
  });

  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final int weekNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPreviousTap,
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        Expanded(
          child: Text(
            'Week #$weekNumber',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        IconButton(
          onPressed: onNextTap,
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      ],
    );
  }
}
