import 'package:flutter/material.dart';
import 'package:splitwise_split_options/src/state_models.dart';

class SplitBySharesEditorControls extends StatefulWidget {
  const SplitBySharesEditorControls({
    required this.users,
    required this.shares,
    required this.totalShares,
    required this.onShareChanged,
    super.key,
  });

  final List<User> users;
  final Map<String, int> shares;
  final int totalShares;
  final void Function(String, String?) onShareChanged;

  @override
  State<SplitBySharesEditorControls> createState() =>
      _SplitBySharesEditorControlsState();
}

class _SplitBySharesEditorControlsState
    extends State<SplitBySharesEditorControls> {
  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    for (final _ in widget.users) {
      _addController(_);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(SplitBySharesEditorControls oldWidget) {
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
      text: '${widget.shares[_.name] ?? 0}',
    )..addListener(
        () {
          final controller = controllers[_.name];
          widget.onShareChanged(_.name, controller?.text);
        },
      );
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
    debugPrint('$runtimeType.controllers.length: ${controllers.length}');
    debugPrint('$runtimeType.users.length: ${widget.users.length}');
    return Column(
      children: widget.users.map(
        (user) {
          final userName = user.name;
          final totalShares = widget.totalShares;
          final sharesForUser = widget.shares[userName] ?? 0;
          final amountFromShares = (sharesForUser * 1000) / totalShares;
          debugPrint(
              '$userName: $sharesForUser/$totalShares - $amountFromShares');

          return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName),
                    Text(
                      '\$${amountFromShares.isNaN ? 0 : amountFromShares.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
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
                  const Text(' share(s)'),
                ],
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
