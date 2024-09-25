import 'package:flutter/material.dart';
import 'package:splitwise_split_options/src/state_models.dart';

class SplitByExactAmountsEditorControls extends StatefulWidget {
  const SplitByExactAmountsEditorControls({
    required this.users,
    required this.exactAmounts,
    required this.totalAmount,
    required this.onAmountChanged,
    super.key,
  });

  final List<User> users;
  final Map<String, double> exactAmounts;
  final double totalAmount;
  final void Function(String, String?) onAmountChanged;

  @override
  State<SplitByExactAmountsEditorControls> createState() =>
      _SplitByExactAmountsEditorControlsState();
}

class _SplitByExactAmountsEditorControlsState
    extends State<SplitByExactAmountsEditorControls> {
  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    for (final _ in widget.users) {
      _addController(_);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(SplitByExactAmountsEditorControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.users.length > controllers.length) {
      for (final _ in widget.users) {
        if (!controllers.containsKey(_.name)) {
          _addController(_);
        }
      }
    }
  }

  void _addController(User _) {
    controllers[_.name] = TextEditingController(
      text: '${widget.exactAmounts[_.name] ?? 0}',
    )..addListener(() {
        final controller = controllers[_.name];
        widget.onAmountChanged(_.name, controller?.text);
      });
  }

  @override
  void dispose() {
    for (final _ in controllers.values) {
      _.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('$runtimeType.controllers: $controllers');

    return Column(
      children: widget.users.map(
        (user) {
          final userName = user.name;

          return Row(
            children: [
              Expanded(
                child: Text(userName),
              ),
              Row(
                children: [
                  const Text(r'$'),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllers[userName],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
