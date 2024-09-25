import 'package:flutter/material.dart';

class User {
  const User({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
}

class SplitStrategy {
  const SplitStrategy({
    required this.id,
    required this.title,
    required this.description,
    required this.imageAssetPath,
    required this.coverColor,
    required this.resolver,
  });

  final String id;
  final String title;
  final String description;
  final String imageAssetPath;
  final Color coverColor;
  final SplitAllocationResolver<Object> resolver;
}

mixin SplitAllocationResolver<T> {
  T resolve(double amount);
}

class SplitEquallyResolver
    implements SplitAllocationResolver<Map<String, bool>> {
  const SplitEquallyResolver();

  @override
  Map<String, bool> resolve(double amount) {
    throw UnimplementedError();
  }
}

class SplitExactAmountsResolver
    implements SplitAllocationResolver<Map<String, double>> {
  const SplitExactAmountsResolver();

  @override
  resolve(double amount) {
    throw UnimplementedError();
  }
}

class SplitByPercentagesResolver
    implements SplitAllocationResolver<Map<String, double>> {
  const SplitByPercentagesResolver();

  @override
  resolve(double amount) {
    throw UnimplementedError();
  }
}

class SplitBySharesResolver
    implements SplitAllocationResolver<Map<String, int>> {
  const SplitBySharesResolver();

  @override
  Map<String, int> resolve(double amount) {
    throw UnimplementedError();
  }
}
