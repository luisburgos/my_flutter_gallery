import 'package:flutter/material.dart';
import 'package:splitwise_split_options/src/state_models.dart';

abstract class SplitOptionsPageEvent {}

class SetSelectedStrategy extends SplitOptionsPageEvent {
  SetSelectedStrategy({required this.strategy});

  final SplitStrategy strategy;
}

class SetSelectedPayer extends SplitOptionsPageEvent {
  SetSelectedPayer({required this.name});

  final String name;
}

class ClearSelectedPayer extends SplitOptionsPageEvent {}

class UpdateShares extends SplitOptionsPageEvent {
  UpdateShares({
    required this.user,
    required this.value,
  });

  final String user;
  final String? value;
}

class UpdateExactAmounts extends SplitOptionsPageEvent {
  UpdateExactAmounts({
    required this.user,
    required this.value,
  });

  final String user;
  final String? value;
}

class UpdatePercentages extends SplitOptionsPageEvent {
  UpdatePercentages({
    required this.user,
    required this.value,
  });

  final String user;
  final String? value;
}

class UpdateEqualShares extends SplitOptionsPageEvent {
  UpdateEqualShares({
    required this.user,
    required this.value,
  });

  final String user;
  final bool value;
}

class AddUser extends SplitOptionsPageEvent {
  AddUser({
    required this.name,
    required this.icon,
    required this.markSelected,
  });

  final String name;
  final IconData icon;
  final bool markSelected;
}

class DeleteUser extends SplitOptionsPageEvent {
  DeleteUser({required this.name});

  final String name;
}

class RemoveUserSplitAllocations extends SplitOptionsPageEvent {
  RemoveUserSplitAllocations({required this.name});

  final String name;
}

class InitializeUserSplitAllocations extends SplitOptionsPageEvent {
  InitializeUserSplitAllocations({
    required this.name,
    required this.setAsPayer,
  });

  final String name;
  final bool setAsPayer;
}
