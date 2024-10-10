import 'package:cinema_store_pickers/src/pickers/pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @no-doc
class CinemaStorePickersRootPage extends StatelessWidget {
  /// @no-doc
  const CinemaStorePickersRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: ProviderScope(
            child: PickersWidget(),
          ),
        ),
      ),
    );
  }
}
