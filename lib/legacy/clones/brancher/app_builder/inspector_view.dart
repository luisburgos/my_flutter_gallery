import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/legacy/clones/brancher/app_builder/app_builder_inspector_body_fields.dart';

class InspectorView extends StatelessWidget {
  const InspectorView({
    required this.actions,
    super.key,
  });

  final InspectorBodyFieldsActions actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          AppBuilderInspectorBodyFields(
            actions: actions,
          ),
        ],
      ),
    );
  }
}
