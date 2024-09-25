import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/legacy/clones/habits/habits_model.dart';

class SimpleGlobalMetricsModel {
  const SimpleGlobalMetricsModel(this.weeks);

  final List<Week> weeks;

  int get doneCount => countAllWithStatus(HabitEntryStatus.done);
  int get partialCount => countAllWithStatus(HabitEntryStatus.partial);
  int get missedCount => countAllWithStatus(HabitEntryStatus.missed);
  int get initialCount => countAllWithStatus(HabitEntryStatus.initial);

  int countAllWithStatus(HabitEntryStatus status) {
    var total = 0;
    for (final w in weeks) {
      for (final h in w.habits) {
        for (final s in h.statuses.values) {
          if (s == status) {
            total += 1;
          }
        }
      }
    }
    return total;
  }
}

class SimpleGlobalMetrics extends StatelessWidget {
  const SimpleGlobalMetrics({
    required this.metrics,
    super.key,
  });

  final SimpleGlobalMetricsModel metrics;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOTALS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Done: ${metrics.doneCount}',
              style: TextStyle(
                color: Colors.green.shade400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Partial: ${metrics.partialCount}',
              style: TextStyle(
                color: Colors.blue.shade400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Missed: ${metrics.missedCount}',
              style: TextStyle(
                color: Colors.red.shade400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Initial: ${metrics.initialCount}',
              style: TextStyle(
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
