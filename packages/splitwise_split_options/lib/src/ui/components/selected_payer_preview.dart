import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitwise_split_options/src/state_holder.dart';

class SelectedPayerPreview extends StatelessWidget {
  const SelectedPayerPreview({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SplitOptionsPageStateHolder>().state;
    final payer = state.payer;

    return ListTile(
      leading: payer != null ? Icon(payer.icon) : null,
      title: payer != null ? Text(payer.name) : const Text('Choose payer'),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.chevron_right),
      ),
    );
  }
}
