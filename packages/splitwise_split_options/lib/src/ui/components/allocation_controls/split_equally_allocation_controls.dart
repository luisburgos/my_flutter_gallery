import 'package:flutter/material.dart';
import 'package:splitwise_split_options/src/state_models.dart';

class SplitEquallyEditorControls extends StatelessWidget {
  const SplitEquallyEditorControls({
    required this.users,
    required this.selections,
    required this.onSelectionChanged,
    super.key,
  });

  final List<User> users;
  final Map<String, bool> selections;
  final void Function(String, {required bool value}) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: users.map(
        (user) {
          final userName = user.name;
          final currentValue = selections[userName] ?? true;
          debugPrint('currentValue: $currentValue');

          return Row(
            children: [
              Expanded(
                child: Text(userName),
              ),
              Checkbox(
                value: currentValue,
                onChanged: (_) {
                  debugPrint('onChanged: $_');
                  onSelectionChanged.call(user.name, value: _ ?? false);
                },
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
