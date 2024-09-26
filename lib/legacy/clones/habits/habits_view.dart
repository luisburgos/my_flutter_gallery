import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/legacy/clones/habits/components/all_habits_preview.dart';
import 'package:my_flutter_gallery/legacy/clones/habits/components/metrics.dart';
import 'package:my_flutter_gallery/legacy/clones/habits/habits_cubit.dart';

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

    if (state.weeks.isEmpty) {
      return const CircularProgressIndicator();
    }

    return Row(
      children: [
        const Expanded(
          child: SizedBox.expand(),
        ),
        AllHabitsPreview(
          completionPercentage: state.completionPercentage,
          selectedWeekIndex: state.selectedWeekIndex,
          selectedWeekHabits: state.selectedWeekHabits,
          onNextTap: cubit.nextWeek,
          onPreviousTap: cubit.previousWeek,
          changeDayStatus: cubit.changeDayStatus,
        ),
        Expanded(
          child: SimpleGlobalMetrics(
            metrics: SimpleGlobalMetricsModel(state.weeks),
          ),
        ),
      ],
    );
  }
}
