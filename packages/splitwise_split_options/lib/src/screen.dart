import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconpicker_plus/flutter_iconpicker.dart';
import 'package:splitwise_split_options/src/events.dart';
import 'package:splitwise_split_options/src/page_state.dart';
import 'package:splitwise_split_options/src/page_template.dart';
import 'package:splitwise_split_options/src/state_holder.dart';
import 'package:splitwise_split_options/src/ui/components/selected_payer_preview.dart';
import 'package:splitwise_split_options/src/ui/components/selected_split_strategy_preview.dart';
import 'package:splitwise_split_options/src/ui/components/split_strategy_allocation_summary.dart';
import 'package:splitwise_split_options/src/ui/components/split_strategy_selector.dart';
import 'package:splitwise_split_options/src/ui/components/split_strategy_user_allocation_controls.dart';

class SplitOptionsScreen extends StatelessWidget {
  const SplitOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SplitOptionsPageStateHolder>().state;
    final strategies = state.strategies;

    return DefaultTabController(
      length: strategies.length,
      child: Builder(
        builder: (context) {
          return SplitOptionsPageTemplate(
            appBar: AppBar(
              title: const Text('Split Options'),
            ),
            header: SelectedPayerPreview(
              onPressed: () {
                _showPayerSelectorBottomSheet(
                  context: context,
                  state: state,
                  onUserSelected: (_) {
                    context.read<SplitOptionsPageStateHolder>().add(
                          SetSelectedPayer(name: _),
                        );
                  },
                  onCreateUser: (_, icon) {
                    context.read<SplitOptionsPageStateHolder>().add(
                          AddUser(
                            name: _,
                            icon: icon,
                            markSelected: true,
                          ),
                        );
                  },
                  onDeleteConfirmed: (_) {
                    context.read<SplitOptionsPageStateHolder>().add(
                          DeleteUser(name: _),
                        );
                  },
                );
              },
            ),
            body: const Column(
              children: [
                SelectedSplitStrategyPreview(),
                Divider(),
                SplitStrategySelector(),
                Expanded(
                  child: SplitStrategyUserAllocationControls(),
                ),
              ],
            ),
            footer: const SplitStrategyAllocationSummary(),
          );
        },
      ),
    );
  }
}

Future<void> _showPayerSelectorBottomSheet({
  required BuildContext context,
  required SplitOptionsPageState state,
  required void Function(String) onUserSelected,
  required void Function(String) onDeleteConfirmed,
  required void Function(String, IconData) onCreateUser,
}) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return UserSelectionView(
        key: Key(DateTime.now().toIso8601String()),
        state: state,
        onUserSelected: onUserSelected,
        onCreateUser: onCreateUser,
        onDeleteUser: onDeleteConfirmed,
      );
    },
  );
}

class UserSelectionView extends StatefulWidget {
  const UserSelectionView({
    required this.state,
    required this.onUserSelected,
    required this.onCreateUser,
    required this.onDeleteUser,
    super.key,
  });

  final SplitOptionsPageState state;
  final void Function(String) onUserSelected;
  final void Function(String) onDeleteUser;
  final void Function(String, IconData) onCreateUser;

  @override
  State<UserSelectionView> createState() => _UserSelectionViewState();
}

class _UserSelectionViewState extends State<UserSelectionView> {
  final controller = TextEditingController();
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Choose payer',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.state.users.length,
            itemBuilder: (context, index) {
              final user = widget.state.users[index];
              final isSelected = user.name == widget.state.payer?.name;

              return ListTile(
                title: Text(user.name),
                trailing: isSelected ? const Icon(Icons.check) : null,
                onTap: () {
                  Navigator.pop(context);
                  widget.onUserSelected(user.name);
                },
                onLongPress: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Deletion'),
                        content: const Text(
                          'Are you sure you want to delete '
                          'this user? This action cannot be undone.',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Delete'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              widget.onDeleteUser(user.name);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'New user name',
                border: const OutlineInputBorder(),
                prefix: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    onPressed: () async {
                      final icon = await FlutterIconPicker.showIconPicker(
                        context,
                        iconPackModes: [IconPack.material],
                      );
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    icon: Icon(selectedIcon ?? Icons.grid_view_sharp),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () async {
                      final newUsername = controller.text.trim();

                      if (newUsername.isNotEmpty && selectedIcon != null) {
                        Navigator.pop(context);
                        widget.onCreateUser(newUsername, selectedIcon!);
                      }
                    },
                    child: const Text('CREATE'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
