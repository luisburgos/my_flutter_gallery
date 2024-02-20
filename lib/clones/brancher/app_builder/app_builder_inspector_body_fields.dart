import 'package:flutter/material.dart';

class InspectorBodyFieldsActions {
  const InspectorBodyFieldsActions({
    required this.onTitleChanged,
    required this.onDescriptionChanged,
    required this.onAuthorNameChanged,
  });

  final void Function(String) onTitleChanged;
  final void Function(String) onDescriptionChanged;
  final void Function(String) onAuthorNameChanged;
}

class AppBuilderInspectorBodyFields extends StatelessWidget {
  const AppBuilderInspectorBodyFields({
    required this.actions,
    super.key,
  });

  final InspectorBodyFieldsActions actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          FormFieldBuilder(
            label: 'App Title',
            onChanged: actions.onTitleChanged,
          ),
          FormFieldBuilder(
            label: 'Author Name',
            onChanged: actions.onAuthorNameChanged,
          ),
          FormFieldBuilder(
            label: 'Description',
            onChanged: actions.onDescriptionChanged,
          ),
        ],
      ),
    );
  }
}

class FormFieldBuilder extends StatelessWidget {
  const FormFieldBuilder({
    required this.label,
    required this.onChanged,
    super.key,
  });

  final String label;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              cursorColor: Theme.of(context).colorScheme.onSecondary,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
              ),
              style: const TextStyle(
                color: Colors.black87,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
