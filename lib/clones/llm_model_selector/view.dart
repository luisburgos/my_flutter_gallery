// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/shared/custom_dropwdown.dart';

import 'cubit.dart';

class LLMSelectorView extends StatefulWidget {
  const LLMSelectorView({super.key});

  @override
  State<LLMSelectorView> createState() => _LLMSelectorViewState();
}

class _LLMSelectorViewState extends State<LLMSelectorView> {
  @override
  void initState() {
    context.read<LLMOptionCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final optionCubit = context.watch<LLMOptionCubit>();
    final items = optionCubit.state.items;
    final selectedItem = optionCubit.state.selectedItem;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              CustomDropDown(
                label: selectedItem == null
                    ? 'Select one'
                    : '${selectedItem.name} - ${selectedItem.version}',
                builder: ({double? width}) {
                  return MenuWidget(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return ListTile(
                          title: Text('${item.name} - ${item.version}'),
                          subtitle: optionCubit.needsPlanUpgrade(item)
                              ? const UpgradePlanButton()
                              : null,
                          onTap: () {
                            optionCubit.setSelected(item);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    required this.child,
    this.width,
    super.key,
  });

  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200,
      height: 300,
      decoration: ShapeDecoration(
        color: Colors.black12,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.5,
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          ),
        ],
      ),
      child: child,
    );
  }
}
