import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/clones/habits/habits_cubit.dart';
import 'package:my_flutter_gallery/clones/habits/habits_service.dart';
import 'package:my_flutter_gallery/clones/habits/habits_view.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (_) => HabitsCubit(
            habitsService: DefaultHabitsService(),
          ),
          child: const HabitsView(),
        ),
      ),
    );
  }
}
