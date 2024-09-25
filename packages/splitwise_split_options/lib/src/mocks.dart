import 'package:flutter/material.dart';
import 'package:splitwise_split_options/src/state_models.dart';

const mockUsers = [
  User(name: 'Mengano', icon: Icons.sunny),
  User(name: 'Fulana', icon: Icons.dark_mode),
];

const mockStrategies = [
  SplitStrategy(
    id: 'split_equally',
    title: 'Split Equally',
    description: 'Select which people owe an equal share',
    imageAssetPath: '',
    coverColor: Colors.blue,
    resolver: SplitEquallyResolver(),
  ),
  SplitStrategy(
    id: 'split_exact_amounts',
    title: 'Split by exact amounts',
    description: 'Specify exactly how much each person owes',
    imageAssetPath: '',
    coverColor: Colors.red,
    resolver: SplitExactAmountsResolver(),
  ),
  SplitStrategy(
      id: 'split_by_percentages',
      title: 'Split by percentages',
      description: "Enter the percentage split that's fair for your situation",
      imageAssetPath: '',
      coverColor: Colors.purple,
      resolver: SplitByPercentagesResolver()),
  SplitStrategy(
    id: 'split_by_shares',
    title: 'Split by shares',
    description: 'Great for time-bases splitting (2 nights = 2 shares), '
        'across families (family of 3 = 3 shares)',
    imageAssetPath: '',
    coverColor: Colors.orange,
    resolver: SplitBySharesResolver(),
  ),
];
