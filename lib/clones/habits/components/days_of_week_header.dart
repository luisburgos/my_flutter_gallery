import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/clones/habits/habits_model.dart';

class DaysOfWeekHeader extends StatelessWidget {
  const DaysOfWeekHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Days.values.map(
        (day) {
          final isNotLastDay = Days.sunday != day;

          return Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: Text(
                    day.letter.toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
              if (isNotLastDay) const SizedBox(width: 8),
            ],
          );
        },
      ).toList(),
    );
  }
}
