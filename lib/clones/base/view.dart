// ignore_for_file: always_use_package_imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    context.read<BaseCubit>().loadOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseCubit = context.watch<BaseCubit>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          'Items count: ${baseCubit.state.items.length}',
        ),
      ),
    );
  }
}
