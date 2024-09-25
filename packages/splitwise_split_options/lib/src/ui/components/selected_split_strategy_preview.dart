import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_split_options/src/state_holder.dart';

class SelectedSplitStrategyPreview extends StatelessWidget {
  const SelectedSplitStrategyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SplitOptionsPageStateHolder>().state;
    final selectedStrategy = state.selectedStrategy!;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 120,
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 20,
              ),
              child: Text(
                selectedStrategy.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: selectedStrategy.coverColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 20,
              ),
              child: Text(
                selectedStrategy.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: selectedStrategy.coverColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
