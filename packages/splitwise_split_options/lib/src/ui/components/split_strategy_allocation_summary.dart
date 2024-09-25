import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_split_options/src/state_holder.dart';

class SplitStrategyAllocationSummary extends StatelessWidget {
  const SplitStrategyAllocationSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SplitOptionsPageStateHolder>().state;
    final selectedStrategy = state.selectedStrategy!;

    late Widget child;
    switch (selectedStrategy.id) {
      case 'split_equally':
        if (state.totalEqualSharesSelected == 0) {
          child = const Column(
            children: [
              Text('You must select at least one person to split with'),
            ],
          );
        } else {
          child = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${state.amount / state.totalEqualSharesSelected}/person'),
              Text(
                '(${state.totalEqualSharesSelected} people)',
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          );
        }
      case 'split_exact_amounts':
        child = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('\$${state.exactAmountsSum} of \$${state.amount}'),
            Text(
              '(\$${state.amount - state.exactAmountsSum} left)',
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        );
      case 'split_by_percentages':
        child = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${state.percentagesSum}% of 100%'),
            Text(
              '(${100 - state.percentagesSum}% left)',
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        );
      case 'split_by_shares':
        child = Text('${state.totalShares} total shares');
      default:
        throw UnimplementedError('No controls for id: ${selectedStrategy.id}');
    }

    return Container(
      //color: selectedStrategy.coverColor.withOpacity(0.08),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: child,
    );
  }
}
