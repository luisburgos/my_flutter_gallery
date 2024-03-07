import 'package:bloc/bloc.dart';
import 'package:my_flutter_gallery/clones/habits/habits_model.dart';
import 'package:my_flutter_gallery/clones/habits/habits_service.dart';

class HabitsCubit extends Cubit<HabitsModel> {
  HabitsCubit({
    required this.habitsService,
  }) : super(const HabitsModel());

  final HabitsService habitsService;

  void nextWeek() {
    final currentWeekIndex = state.selectedWeekIndex;
    final newWeekIndex = currentWeekIndex + 1;
    if (newWeekIndex > state.weeks.length - 1) return;

    final newSelectedWeek = state.weeks[newWeekIndex];
    emit(
      state.copyWith(
        selectedWeek: newSelectedWeek,
      ),
    );
  }

  void previousWeek() {
    final currentWeekIndex = state.selectedWeekIndex;
    final newWeekIndex = currentWeekIndex - 1;
    if (newWeekIndex < 0) return;

    final newSelectedWeek = state.weeks[newWeekIndex];
    emit(
      state.copyWith(
        selectedWeek: newSelectedWeek,
      ),
    );
  }

  // TODO(unassigned): improve logic and model design
  void changeDayStatus(Habit habit, Days day) {
    final habitIndex = state.selectedWeekHabits.indexOf(habit);
    final habitStatuses = Map<Days, HabitEntryStatus>.from(
      state.selectedWeekHabits[habitIndex].statuses,
    );

    final habitStatusForDay = habitStatuses[day] ?? HabitEntryStatus.initial;
    final nextStatusForEntry = _getNextStatus(habitStatusForDay);

    habitStatuses[day] = nextStatusForEntry;

    final asd = List<Habit>.from(state.selectedWeekHabits);
    final asdCurrent = asd[habitIndex];
    asd[habitIndex] = asdCurrent.copyWith(statuses: habitStatuses);

    final nextWeekState = state.selectedWeek?.copyWith(
      habits: asd,
    );

    final newWeeksState = List<Week>.from(state.weeks);
    newWeeksState[state.selectedWeekIndex] = nextWeekState!;

    // TODO(unassigned): uncomment and fix
    final nextState = state.copyWith(
      selectedWeek: nextWeekState,
      weeks: newWeeksState,
    );
    emit(nextState);
  }

  Future<void> load() async {
    final entries = await habitsService.getHabitEntries();
    emit(
      state.copyWith(
        selectedWeek: entries.first,
        weeks: entries,
      ),
    );
  }

  HabitEntryStatus _getNextStatus(HabitEntryStatus current) {
    switch (current) {
      case HabitEntryStatus.initial:
        return HabitEntryStatus.partial;
      case HabitEntryStatus.partial:
        return HabitEntryStatus.done;
      case HabitEntryStatus.done:
        return HabitEntryStatus.missed;
      case HabitEntryStatus.missed:
        return HabitEntryStatus.initial;
    }
  }
}
