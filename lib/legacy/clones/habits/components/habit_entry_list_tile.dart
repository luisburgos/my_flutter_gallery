import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/legacy/clones/habits/habits_model.dart';

typedef OnDayTap = void Function(Days);

class HabitEntryListTile extends StatelessWidget {
  const HabitEntryListTile({
    required this.data,
    required this.onDayTap,
    super.key,
  });

  final Habit data;
  final OnDayTap onDayTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text('${data.completionPercentage}%'),
              ],
            ),
          ),
          WeekSlots(
            onDayTap: onDayTap,
            statuses: data.statuses,
          ),
        ],
      ),
    );
  }
}

class WeekSlots extends StatelessWidget {
  const WeekSlots({
    required this.statuses,
    required this.onDayTap,
    super.key,
  });

  final HabitEntryDaysStatuses statuses;
  final OnDayTap onDayTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Days.values.map(
        (day) {
          final isNotLastDay = Days.sunday != day;
          final currentStatusForDay = statuses[day];
          final color = _getColorForStatus(currentStatusForDay);

          return Row(
            children: [
              DaySlot(
                color: color,
                onTap: () => onDayTap.call(day),
              ),
              if (isNotLastDay) const SizedBox(width: 8),
            ],
          );
        },
      ).toList(),
    );
  }

  Color _getColorForStatus(HabitEntryStatus? currentStatusForDay) {
    if (currentStatusForDay == HabitEntryStatus.done) {
      return Colors.green.shade200;
    }
    if (currentStatusForDay == HabitEntryStatus.partial) {
      return Colors.blue.shade200;
    }
    if (currentStatusForDay == HabitEntryStatus.missed) {
      return Colors.red.shade200;
    }

    return Colors.grey.shade200;
  }
}

class DaySlot extends StatelessWidget {
  const DaySlot({
    required this.color,
    required this.onTap,
    this.size = 40,
    super.key,
  });

  final double size;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 5),
            border: Border.all(width: 2),
            color: color,
          ),
        ),
      ),
    );
  }
}
