import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_split_options/src/events.dart';
import 'package:splitwise_split_options/src/state_holder.dart';
import 'package:splitwise_split_options/src/ui/widgets.dart';

class SplitStrategySelector extends StatelessWidget {
  const SplitStrategySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<SplitOptionsPageStateHolder>().state;
        final strategies = state.strategies;
        final selectedStrategy = state.selectedStrategy!;

        return Row(
          children: strategies.map(
            (strategy) {
              return SplitOptionIconButton(
                strategyId: strategy.id,
                strategyCoverColor: strategy.coverColor,
                isActive: selectedStrategy.id == strategy.id,
                onTabPressed: () {
                  context.read<SplitOptionsPageStateHolder>().add(
                        SetSelectedStrategy(
                          strategy: strategy,
                        ),
                      );

                  final tabController = DefaultTabController.of(context);
                  final nextIndex = strategies.indexOf(strategy);
                  tabController.animateTo(
                    nextIndex,
                    duration: Duration.zero,
                  );
                },
              );
            },
          ).toList(),
        );
      },
    );
  }
}
