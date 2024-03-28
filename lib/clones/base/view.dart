// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  void initState() {
    context.read<MyCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myCubit = context.watch<MyCubit>();
    final items = myCubit.state.items;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Items count: ${items.length}'),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(
                  item.name,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
