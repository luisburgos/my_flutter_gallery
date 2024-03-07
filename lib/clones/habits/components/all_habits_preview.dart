import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/clones/habits/components/custom_divider.dart';
import 'package:my_flutter_gallery/clones/habits/components/days_of_week_header.dart';
import 'package:my_flutter_gallery/clones/habits/components/habit_entry_list_tile.dart';
import 'package:my_flutter_gallery/clones/habits/components/week_header.dart';
import 'package:my_flutter_gallery/clones/habits/habits_model.dart';

class AllHabitsPreview extends StatelessWidget {
  const AllHabitsPreview({
    required this.completionPercentage,
    required this.selectedWeekIndex,
    required this.selectedWeekHabits,
    required this.onPreviousTap,
    required this.onNextTap,
    required this.changeDayStatus,
    super.key,
  });

  final double completionPercentage;
  final int selectedWeekIndex;
  final List<Habit> selectedWeekHabits;
  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final void Function(Habit, Days) changeDayStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
        maxWidth: (44 * 7) + (8 * 6) + 40,
      ),
      child: Column(
        children: [
          WeekHeader(
            weekNumber: selectedWeekIndex,
            onNextTap: onNextTap,
            onPreviousTap: onPreviousTap,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                // TODO(unassigned): use/improve LinearAvailabilityIndicatorBar
                Align(
                  //alignment: Alignment.center,
                  child: Text(
                    '$completionPercentage% achieved',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const CustomDivider(),
          if (selectedWeekHabits.isEmpty)
            const Text('No entries')
          else
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const DaysOfWeekHeader(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: selectedWeekHabits.length,
                    itemBuilder: (context, index) {
                      final item = selectedWeekHabits[index];
                      return HabitEntryListTile(
                        data: item,
                        onDayTap: (_) {
                          changeDayStatus(item, _);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
