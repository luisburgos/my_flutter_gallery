// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'service.dart';
import 'view.dart';

class LLMSelectorPage extends StatelessWidget {
  const LLMSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (_) => LLMOptionCubit(
            optionsService: DefaultLLMService(),
          ),
          child: const LLMSelectorView(),
        ),
      ),
    );
  }
}
