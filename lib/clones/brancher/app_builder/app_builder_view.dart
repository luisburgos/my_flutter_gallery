import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/clones/brancher/app_builder/app_builder_cubit.dart';
import 'package:my_flutter_gallery/clones/brancher/app_builder/app_builder_inspector_body_fields.dart';
import 'package:my_flutter_gallery/clones/brancher/app_builder/inspector_view.dart';
import 'package:my_flutter_gallery/clones/brancher/app_builder/preview_view.dart';

class AppBuilderView extends StatelessWidget {
  const AppBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    // No need for Scaffold
    return const Column(
      children: [
        Header(
          title: 'App Builder',
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.2,
          height: 1,
        ),
        Expanded(
          child: Body(),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              constraints: const BoxConstraints(
                minWidth: 300,
                minHeight: 40,
              ),
              child: const Center(
                child: Text(
                  'AppBuilder.Controls',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppBuilderCubit>().state;
    final appTitle = state.appTitle;
    final description = state.description;
    final displayName = state.createdBy?.displayName;

    return SizedBox.expand(
      child: Row(
        children: [
          Expanded(
            child: InspectorView(
              actions: InspectorBodyFieldsActions(
                onTitleChanged: (_) {
                  context.read<AppBuilderCubit>().setAppTitle(_);
                },
                onDescriptionChanged: (_) {
                  context.read<AppBuilderCubit>().setDescription(_);
                },
                onAuthorNameChanged: (_) {
                  context.read<AppBuilderCubit>().setAuthorName(_);
                },
              ),
            ),
          ),
          Expanded(
            child: PreviewView(
              previewBodyData: PreviewBodyData(
                title: appTitle ?? 'Untitled',
                description: description ?? 'No description',
                authorName: displayName ?? 'Unknown',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
