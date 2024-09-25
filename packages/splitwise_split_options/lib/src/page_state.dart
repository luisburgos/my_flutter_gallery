import 'package:splitwise_split_options/src/state_models.dart';

class SplitOptionsPageState {
  SplitOptionsPageState({
    this.strategies = const [],
    this.users = const [],
    this.selectedStrategy,
    this.payer,
    this.amount = 1000,
    this.equalSharesSelections = const {},
    this.shares = const {},
    this.exactAmounts = const {},
    this.percentages = const {},
  });

  final List<SplitStrategy> strategies;
  final List<User> users;
  final SplitStrategy? selectedStrategy;
  final User? payer;
  final double amount;
  final Map<String, bool> equalSharesSelections;
  final Map<String, int> shares;
  final Map<String, double> exactAmounts;
  final Map<String, double> percentages;

  int get totalEqualSharesSelected => equalSharesSelections.isEmpty
      ? users.length
      : equalSharesSelections.values.where((value) => value == true).length;

  int get totalShares =>
      shares.isEmpty ? 0 : shares.values.reduce((_, __) => _ + __);

  double get exactAmountsSum =>
      exactAmounts.isEmpty ? 0 : exactAmounts.values.reduce((_, __) => _ + __);

  double get percentagesSum =>
      percentages.isEmpty ? 0 : percentages.values.reduce((_, __) => _ + __);

  SplitOptionsPageState copyWith({
    List<SplitStrategy> Function()? strategies,
    List<User> Function()? users,
    SplitStrategy? Function()? selectedStrategy,
    User? Function()? payer,
    double Function()? amount,
    Map<String, int> Function()? shares,
    Map<String, double> Function()? exactAmounts,
    Map<String, double> Function()? percentages,
    Map<String, bool> Function()? equalSharesSelections,
  }) {
    return SplitOptionsPageState(
      strategies: strategies != null ? strategies() : this.strategies,
      users: users != null ? users() : this.users,
      selectedStrategy:
          selectedStrategy != null ? selectedStrategy() : this.selectedStrategy,
      payer: payer != null ? payer() : this.payer,
      amount: amount != null ? amount() : this.amount,
      shares: shares != null ? shares() : this.shares,
      exactAmounts: exactAmounts != null ? exactAmounts() : this.exactAmounts,
      percentages: percentages != null ? percentages() : this.percentages,
      equalSharesSelections: equalSharesSelections != null
          ? equalSharesSelections()
          : this.equalSharesSelections,
    );
  }
}
