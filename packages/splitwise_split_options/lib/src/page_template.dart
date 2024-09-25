import 'package:flutter/material.dart';

class SplitOptionsPageTemplate extends StatelessWidget {
  const SplitOptionsPageTemplate({
    required this.appBar,
    required this.header,
    required this.body,
    required this.footer,
    super.key,
  });

  final PreferredSizeWidget appBar;
  final Widget header;
  final Widget body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          const Divider(),
          header,
          const Divider(),
          Expanded(
            child: body,
          ),
          const Divider(),
          footer,
        ],
      ),
    );
  }
}
