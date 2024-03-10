// ignore_for_file: always_use_package_imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class ResonanceView extends StatefulWidget {
  const ResonanceView({super.key});

  @override
  State<ResonanceView> createState() => _ResonanceViewState();
}

class _ResonanceViewState extends State<ResonanceView> {
  @override
  void initState() {
    context.read<ResonanceCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resonanceCubit = context.watch<ResonanceCubit>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          'Items count: ${resonanceCubit.state.items.length}',
        ),
      ),
    );
  }
}
