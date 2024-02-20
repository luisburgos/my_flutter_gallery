import 'package:flutter/material.dart';

class SimpleGrid<T> extends StatelessWidget {
  const SimpleGrid({
    required this.items,
    required this.itemBuilder,
    super.key,
  });

  final List<T> items;
  final Widget Function(T) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: items.isEmpty ? 1 : items.length,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: items.length * 1.2 / items.length,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return itemBuilder(item);
      },
    );
  }
}
