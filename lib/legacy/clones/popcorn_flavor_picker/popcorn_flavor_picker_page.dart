import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/legacy/clones/popcorn_flavor_picker/popcorn_flavor_options_service.dart';
import 'package:my_flutter_gallery/legacy/clones/popcorn_flavor_picker/popcorn_flavor_picker_cubit.dart';
import 'package:my_flutter_gallery/legacy/clones/popcorn_flavor_picker/popcorn_flavor_picker_view.dart';

class PopcornFlavorPickerPage extends StatelessWidget {
  const PopcornFlavorPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (_) => PopcornFlavorPickerCubit(
            optionsService: DefaultPopcornFlavorPickerOptionsService(),
          ),
          child: const PopcornFlavorPickerView(),
        ),
      ),
    );
  }
}
