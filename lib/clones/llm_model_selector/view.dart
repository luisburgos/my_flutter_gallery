// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class LLMSelectorView extends StatefulWidget {
  const LLMSelectorView({super.key});

  @override
  State<LLMSelectorView> createState() => _LLMSelectorViewState();
}

class _LLMSelectorViewState extends State<LLMSelectorView> {
  @override
  void initState() {
    context.read<LLMOptionCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final optionCubit = context.watch<LLMOptionCubit>();
    final items = optionCubit.state.items;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Items count: ${items.length}',
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
              );
            },
          ),
        ],
      ),
    );
  }
}
