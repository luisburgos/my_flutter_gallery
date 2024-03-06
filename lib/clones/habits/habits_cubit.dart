import 'package:bloc/bloc.dart';
import 'package:my_flutter_gallery/clones/habits/habits_model.dart';
import 'package:my_flutter_gallery/clones/habits/habits_service.dart';

class HabitsCubit extends Cubit<HabitsModel> {
  HabitsCubit({
    required this.habitsService,
  }) : super(const HabitsModel());

  final HabitsService habitsService;

  Future<void> load() async {}
}
