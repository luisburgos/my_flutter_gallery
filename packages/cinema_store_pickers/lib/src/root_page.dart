import 'package:cinema_store_pickers/src/popcorn_picker/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class CinemaStorePickersRootPage extends StatelessWidget {
  /// @no-doc
  const CinemaStorePickersRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        body: SafeArea(
          child: PopcornPickerWidget(),
        ),
      ),
    );
  }
}
