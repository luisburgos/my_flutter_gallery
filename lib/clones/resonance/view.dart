// ignore_for_file: always_use_package_imports
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/clones/resonance/data_model.dart';

import 'cubit.dart';

T getRandomElement<T>(List<T> list) {
  final random = Random();
  final i = random.nextInt(list.length);
  return list[i];
}

class ResonanceView extends StatefulWidget {
  const ResonanceView({super.key});

  @override
  State<ResonanceView> createState() => _ResonanceViewState();
}

class _ResonanceViewState extends State<ResonanceView> {
  @override
  void initState() {
    context.read<ResonanceCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resonanceCubit = context.watch<ResonanceCubit>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: _ResonanceListView(
              nameFontSize: (_) {
                const baseFontSize = 16.0;
                if (resonanceCubit.withIncreasingFontSize && _ > 0) {
                  return baseFontSize * ((_ / 75) + 1);
                }
                return baseFontSize;
              },
              items: resonanceCubit.state.itemsVotes.entries.toList(),
              onUpTap: resonanceCubit.upVote,
              onDownTap: resonanceCubit.downVote,
            ),
          ),
          if (resonanceCubit.withAddPhraseButton)
            _Footer(
              onAddTap: () {
                resonanceCubit.addPhrase('New phrase');
              },
            ),
        ],
      ),
    );
  }
}

class _ResonanceListView extends StatelessWidget {
  const _ResonanceListView({
    required this.nameFontSize,
    required this.items,
    required this.onUpTap,
    required this.onDownTap,
  });

  final double Function(int) nameFontSize;
  final List<MapEntry<ResonanceDataModel, int>> items;
  final void Function(ResonanceDataModel) onUpTap;
  final void Function(ResonanceDataModel) onDownTap;

  @override
  Widget build(BuildContext context) {
    final sortedEntries = items.toList()
      ..sort(
        (a, b) => b.value.compareTo(a.value),
      );

    sortedEntries.map((e) => e.key).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: sortedEntries.length,
      itemBuilder: (context, index) {
        final item = sortedEntries[index];
        return ListTile(
          title: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      item.key.name,
                      style: TextStyle(
                        fontSize: nameFontSize(item.value),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${item.value}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => onUpTap(item.key),
                icon: const Icon(
                  FontAwesomeIcons.arrowUp,
                  size: 16,
                ),
              ),
              IconButton(
                onPressed: () => onDownTap(item.key),
                icon: const Icon(
                  FontAwesomeIcons.arrowDown,
                  size: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.onAddTap,
  });

  final VoidCallback onAddTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: ElevatedButton(
        onPressed: onAddTap,
        child: const Text('ADD PHRASE'),
      ),
    );
  }
}
