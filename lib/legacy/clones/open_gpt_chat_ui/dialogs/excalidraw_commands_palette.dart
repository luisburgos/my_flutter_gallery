import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/legacy/clones/open_gpt_chat_ui/dialogs/dialogs.dart';

class ExcalidrawCommandsPalette extends StatelessWidget {
  const ExcalidrawCommandsPalette({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogBase(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const _SearchBar(),
            const _QuickActions(),
            Expanded(
              // TODO(luisburgos): add onTap command callback handler
              child: _CommandsList(
                items: [
                  _CommandGroupModel(
                    name: 'App',
                    commands: [
                      _CommandListTileModel(
                        name: 'Library',
                        keys: [],
                      ),
                      _CommandListTileModel(
                        name: 'Live Collaboration',
                        keys: [],
                      ),
                      _CommandListTileModel(
                        name: 'Toggle Theme',
                        keys: [],
                      ),
                    ],
                  ),
                  _CommandGroupModel(
                    name: 'Export',
                    commands: [
                      _CommandListTileModel(
                        name: 'Export image',
                        keys: ['CMD', 'SHIFT', 'E'],
                      ),
                      _CommandListTileModel(
                        name: 'Save to disk',
                        keys: ['CMD', 'S'],
                      ),
                    ],
                  ),
                  _CommandGroupModel(
                    name: 'Editor',
                    commands: [
                      _CommandListTileModel(
                        name: 'Undo',
                        keys: [],
                      ),
                      _CommandListTileModel(
                        name: 'Zoom In',
                        keys: ['CMD', '+'],
                      ),
                      _CommandListTileModel(
                        name: 'Zoom Out',
                        keys: ['CMD', '-'],
                      ),
                    ],
                  ),
                  _CommandGroupModel(
                    name: 'Other',
                    commands: [
                      _CommandListTileModel(
                        name: 'Github',
                        keys: [],
                      ),
                      _CommandListTileModel(
                        name: 'Follow us',
                        keys: [],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar();

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Search menus, commands and discover hidden gems',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            //borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
      ),
    );
  }
}

// TODO(luisburgos): make actions work and improve design
class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Text('[UP/DOWN] Select'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Text('[ENTER] Confirm'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Text('[ESC] Close'),
          ),
        ],
      ),
    );
  }
}

class _CommandGroupModel {
  _CommandGroupModel({
    required this.name,
    required this.commands,
  });

  final String name;
  final List<_CommandListTileModel> commands;
}

class _CommandsList extends StatelessWidget {
  const _CommandsList({
    required this.items,
  });

  final List<_CommandGroupModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final group = items[index];
        return _CommandsGroup(data: group);
      },
    );
  }
}

class _CommandsGroup extends StatelessWidget {
  const _CommandsGroup({
    required this.data,
  });

  final _CommandGroupModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.commands.length,
              itemBuilder: (context, index) {
                final command = data.commands[index];
                return _CommandListTile(data: command);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CommandListTileModel {
  _CommandListTileModel({
    required this.name,
    required this.keys,
  });

  final String name;
  final List<String> keys;
}

// TODO(luisburgos): add onTap callback
class _CommandListTile extends StatelessWidget {
  const _CommandListTile({required this.data});

  final _CommandListTileModel data;

  @override
  Widget build(BuildContext context) {
    return KeyboardShortcutListTile(
      name: data.name,
      keys: data.keys,
    );
  }
}
