import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_split_options/src/events.dart';
import 'package:splitwise_split_options/src/state_holder.dart';
import 'package:splitwise_split_options/src/ui/components/allocation_controls/split_by_exact_amounts_allocation_controls.dart';
import 'package:splitwise_split_options/src/ui/components/allocation_controls/split_by_percentages_allocation_controls.dart';
import 'package:splitwise_split_options/src/ui/components/allocation_controls/split_by_shares_allocation_controls.dart';
import 'package:splitwise_split_options/src/ui/components/allocation_controls/split_equally_allocation_controls.dart';

class SplitStrategyUserAllocationControls extends StatelessWidget {
  const SplitStrategyUserAllocationControls({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SplitOptionsPageStateHolder>().state;
    final users = state.users;
    final strategies = state.strategies;
    final shares = state.shares;
    final totalShares = state.totalShares;

    return TabBarView(
      children: strategies.map(
        (strategy) {
          late List<Widget> children;
          switch (strategy.id) {
            case 'split_equally':
              children = [
                SplitEquallyEditorControls(
                  users: users,
                  selections: state.equalSharesSelections,
                  onSelectionChanged: (_, {required bool value}) {
                    context.read<SplitOptionsPageStateHolder>().add(
                          UpdateEqualShares(
                            user: _,
                            value: value,
                          ),
                        );
                  },
                ),
              ];
            case 'split_exact_amounts':
              children = [
                SplitByExactAmountsEditorControls(
                  users: users,
                  exactAmounts: state.exactAmounts,
                  totalAmount: state.amount,
                  onAmountChanged: (_, __) {
                    context.read<SplitOptionsPageStateHolder>().add(
                          UpdateExactAmounts(
                            user: _,
                            value: __,
                          ),
                        );
                  },
                ),
              ];
            case 'split_by_percentages':
              children = [
                SplitByPercentagesEditorControls(
                  users: users,
                  percentages: state.percentages,
                  totalAmount: state.amount,
                  onPercentageChanged: (_, __) {
                    context.read<SplitOptionsPageStateHolder>().add(
                          UpdatePercentages(
                            user: _,
                            value: __,
                          ),
                        );
                  },
                ),
              ];
            case 'split_by_shares':
              children = [
                SplitBySharesEditorControls(
                  users: users,
                  shares: shares,
                  totalShares: totalShares,
                  onShareChanged: (_, __) {
                    context.read<SplitOptionsPageStateHolder>().add(
                          UpdateShares(
                            user: _,
                            value: __,
                          ),
                        );
                  },
                ),
              ];
            default:
              throw UnimplementedError('No controls for id: ${strategy.id}');
          }

          return Container(
            //color: strategy.coverColor.withOpacity(0.08),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Column(
              children: children,
            ),
          );
        },
      ).toList(),
    );
  }
}
