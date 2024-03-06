import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/clones/habits/habits_cubit.dart';

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

    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [Text('HabitsView')],
      ),
    );
  }
}
