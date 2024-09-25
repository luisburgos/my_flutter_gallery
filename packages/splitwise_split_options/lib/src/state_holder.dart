import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:splitwise_split_options/src/events.dart';
import 'package:splitwise_split_options/src/mocks.dart';
import 'package:splitwise_split_options/src/page_state.dart';
import 'package:splitwise_split_options/src/state_models.dart';

class SplitOptionsPageStateHolder
    extends Bloc<SplitOptionsPageEvent, SplitOptionsPageState> {
  SplitOptionsPageStateHolder()
      : super(
          SplitOptionsPageState(
            strategies: mockStrategies,
            users: mockUsers,
            selectedStrategy: mockStrategies.firstOrNull,
            payer: mockUsers.firstOrNull,
            equalSharesSelections: {
              for (var user in mockUsers) user.name: true,
            },
          ),
        ) {
    /// Split Strategy
    on<SetSelectedStrategy>(_splitOptionsSetSelectedStrategy);

    /// Payer
    on<SetSelectedPayer>(_setSelectedPayer);
    on<ClearSelectedPayer>(_clearSelectedPayer);

    /// User Management
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);

    /// Split Allocations
    on<InitializeUserSplitAllocations>(_initializeUserSplitAllocations);
    on<UpdateEqualShares>(_updateEqualShares);
    on<UpdateExactAmounts>(_updateExactAmounts);
    on<UpdatePercentages>(_updatePercentages);
    on<UpdateShares>(_updateShares);
    on<RemoveUserSplitAllocations>(_removeUserSplitAllocations);
  }

  FutureOr<void> _splitOptionsSetSelectedStrategy(
    SetSelectedStrategy event,
    Emitter<SplitOptionsPageState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedStrategy: () => event.strategy,
      ),
    );
  }

  FutureOr<void> _setSelectedPayer(
    SetSelectedPayer event,
    Emitter<SplitOptionsPageState> emit,
  ) async {
    final newPayer = state.users.firstWhere((_) => _.name == event.name);
    emit(
      state.copyWith(
        payer: () => newPayer,
      ),
    );
  }

  FutureOr<void> _addUser(
    AddUser event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    final newUser = User(name: event.name, icon: event.icon);
    final updatedUsers = [
      ...state.users,
      newUser,
    ];

    emit(
      state.copyWith(
        users: () => updatedUsers,
      ),
    );

    add(
      InitializeUserSplitAllocations(
        name: newUser.name,
        setAsPayer: event.markSelected,
      ),
    );
  }

  FutureOr<void> _deleteUser(
    DeleteUser event,
    Emitter<SplitOptionsPageState> emit,
  ) async {
    final userFind = state.users.where((_) => _.name == event.name);
    if (userFind.isEmpty) {
      return;
    }
    final currentUsers = List.of(state.users)
      ..removeWhere(
        (_) => _.name == event.name,
      );
    emit(
      state.copyWith(
        users: () => currentUsers,
      ),
    );

    if (state.payer?.name == event.name) {
      add(ClearSelectedPayer());
    }

    add(RemoveUserSplitAllocations(name: event.name));
  }

  FutureOr<void> _clearSelectedPayer(
    ClearSelectedPayer event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    emit(
      state.copyWith(
        payer: () => null,
      ),
    );
  }

  FutureOr<void> _updateShares(
    UpdateShares event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    final updatedShares = Map.of(state.shares);
    updatedShares[event.user] = int.tryParse(event.value ?? '0') ?? 0;

    emit(
      state.copyWith(
        shares: () => updatedShares,
      ),
    );
  }

  FutureOr<void> _updateExactAmounts(
    UpdateExactAmounts event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    final updated = Map.of(state.exactAmounts);
    updated[event.user] = double.tryParse(event.value ?? '0') ?? 0;

    emit(
      state.copyWith(
        exactAmounts: () => updated,
      ),
    );
  }

  FutureOr<void> _updatePercentages(
    UpdatePercentages event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    final updated = Map.of(state.percentages);
    updated[event.user] = double.tryParse(event.value ?? '0') ?? 0;

    emit(
      state.copyWith(
        percentages: () => updated,
      ),
    );
  }

  FutureOr<void> _updateEqualShares(
    UpdateEqualShares event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    final updated = Map.of(state.equalSharesSelections);
    updated[event.user] = event.value;

    emit(
      state.copyWith(
        equalSharesSelections: () => updated,
      ),
    );
  }

  FutureOr<void> _initializeUserSplitAllocations(
    InitializeUserSplitAllocations event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    emit(
      state.copyWith(
        payer: () {
          if (event.setAsPayer) {
            return state.users.firstWhere(
              (_) => _.name == event.name,
            );
          }
          return state.payer;
        },
        shares: () => Map.of(state.shares)
          ..putIfAbsent(
            event.name,
            () => 0,
          ),
        equalSharesSelections: () => Map.of(state.equalSharesSelections)
          ..putIfAbsent(
            event.name,
            () => true,
          ),
        exactAmounts: () => Map.of(state.exactAmounts)
          ..putIfAbsent(
            event.name,
            () => 0.0,
          ),
        percentages: () => Map.of(state.percentages)
          ..putIfAbsent(
            event.name,
            () => 0.0,
          ),
      ),
    );
  }

  FutureOr<void> _removeUserSplitAllocations(
    RemoveUserSplitAllocations event,
    Emitter<SplitOptionsPageState> emit,
  ) {
    emit(
      state.copyWith(
        shares: () => Map.of(state.shares)..remove(event.name),
        equalSharesSelections: () =>
            Map.of(state.equalSharesSelections)..remove(event.name),
        exactAmounts: () => Map.of(state.exactAmounts)..remove(event.name),
        percentages: () => Map.of(state.percentages)..remove(event.name),
      ),
    );
  }
}
