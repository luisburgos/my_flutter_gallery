// ignore_for_file: always_use_package_imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/components/custom_dropwdown.dart';

import 'cubit.dart';

class LLMSelectorView extends StatelessWidget {
  const LLMSelectorView({super.key});

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
                    : selectedItem.nameWithVersion,
                builder: ({double? width}) {
                  return MenuWidget(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CustomDropdownOptionsListItem(
                          title: item.nameWithVersion,
                          displayUpgradeButton:
                              optionCubit.needsPlanUpgrade(item),
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

class CustomDropdownOptionsListItem extends StatelessWidget {
  const CustomDropdownOptionsListItem({
    required this.title,
    required this.onTap,
    this.displayUpgradeButton = false,
    super.key,
  });

  final String title;
  final bool displayUpgradeButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: displayUpgradeButton ? const UpgradePlanButton() : null,
      onTap: onTap,
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
