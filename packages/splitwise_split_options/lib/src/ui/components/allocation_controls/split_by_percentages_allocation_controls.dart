import 'package:flutter/material.dart';
import 'package:splitwise_split_options/src/state_models.dart';

class SplitByPercentagesEditorControls extends StatefulWidget {
  const SplitByPercentagesEditorControls({
    required this.users,
    required this.percentages,
    required this.totalAmount,
    required this.onPercentageChanged,
    super.key,
  });

  final List<User> users;
  final Map<String, double> percentages;
  final double totalAmount;
  final void Function(String, String?) onPercentageChanged;

  @override
  State<SplitByPercentagesEditorControls> createState() =>
      _SplitByPercentagesEditorControlsState();
}

class _SplitByPercentagesEditorControlsState
    extends State<SplitByPercentagesEditorControls> {
  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    for (final _ in widget.users) {
      _addController(_);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(SplitByPercentagesEditorControls oldWidget) {
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
      text: '${widget.percentages[_.name] ?? 0}',
    )..addListener(() {
        final controller = controllers[_.name];
        widget.onPercentageChanged(_.name, controller?.text);
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
          final totalShares = widget.totalAmount;
          final sharesForUser = widget.percentages[userName] ?? 0;
          final amountFromShares = (sharesForUser * 1000) / totalShares;
          debugPrint(
            '$userName: $sharesForUser/$totalShares - $amountFromShares',
          );

          return Row(
            children: [
              Expanded(
                child: Text(userName),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllers[userName],
                    ),
                  ),
                  const Text('%'),
                ],
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
