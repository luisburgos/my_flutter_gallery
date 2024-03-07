import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/clones/habits/components/custom_divider.dart';
import 'package:my_flutter_gallery/clones/habits/components/week_header.dart';
import 'package:my_flutter_gallery/clones/habits/habits_cubit.dart';
import 'package:my_flutter_gallery/clones/habits/habits_model.dart';

class HabitsView extends StatefulWidget {
  const HabitsView({super.key});

  @override
  State<HabitsView> createState() => _HabitsViewState();
}

class _HabitsViewState extends State<HabitsView> {
  @override
  void initState() {
    context.read<HabitsCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HabitsCubit>();
    final state = cubit.state;

    final analytics = WeekAnalytics(state.weeks);

    return Row(
      children: [
        const Expanded(
          child: SizedBox.expand(),
        ),
        WeeklyHabits(
          completionPercentage: state.completionPercentage,
          selectedWeekIndex: state.selectedWeekIndex,
          selectedWeekHabits: state.selectedWeekHabits,
          onNextTap: cubit.nextWeek,
          onPreviousTap: cubit.previousWeek,
          changeDayStatus: cubit.changeDayStatus,
        ),
        Expanded(
          child: GlobalAnalytics(
            analytics: analytics,
          ),
        ),
      ],
    );
  }
}

class WeekAnalytics {
  const WeekAnalytics(this.weeks);

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

class GlobalAnalytics extends StatelessWidget {
  const GlobalAnalytics({
    required this.analytics,
    super.key,
  });

  final WeekAnalytics analytics;

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
              'Done: ${analytics.doneCount}',
              style: TextStyle(
                color: Colors.green.shade400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Partial: ${analytics.partialCount}',
              style: TextStyle(
                color: Colors.blue.shade400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Missed: ${analytics.missedCount}',
              style: TextStyle(
                color: Colors.red.shade400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Initial: ${analytics.initialCount}',
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

class WeeklyHabits extends StatelessWidget {
  const WeeklyHabits({
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
          // TODO(unassigned): fix dynamic header and selected week (restart!)
          WeekHeader(
            weekNumber: selectedWeekIndex,
            onNextTap: onNextTap,
            onPreviousTap: onPreviousTap,
          ),
          const CustomDivider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                // TODO(unassigned): use LinearAvailabilityIndicatorBar,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('$completionPercentage% achieved'),
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
                  const WeekSlotsHeader(),
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
            )
        ],
      ),
    );
  }
}

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

typedef OnDayTap = void Function(Days);

class WeekSlotsHeader extends StatelessWidget {
  const WeekSlotsHeader({super.key});

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
