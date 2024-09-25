import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_split_options/src/screen.dart';
import 'package:splitwise_split_options/src/split_options.dart';

class SplitOptionsPage extends StatelessWidget {
  const SplitOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplitOptionsPageStateHolder(),
      child: const SplitOptionsScreen(),
    );
  }
}
