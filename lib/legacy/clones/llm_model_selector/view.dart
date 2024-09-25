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
                builder: (controller, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final isIncludedInCurrentSubscriptionPlan =
                          optionCubit.isIncludedInCurrentSubscriptionPlan(item);
                      return CustomDropdownOptionsListItem(
                        title: item.nameWithVersion,
                        displayUpgradeButton:
                            !isIncludedInCurrentSubscriptionPlan,
                        onTap: isIncludedInCurrentSubscriptionPlan
                            ? () {
                                optionCubit.setSelected(item);
                                controller.toggle();
                              }
                            : null,
                      );
                    },
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
    this.onTap,
    this.displayUpgradeButton = false,
    super.key,
  });

  final String title;
  final bool displayUpgradeButton;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: displayUpgradeButton ? const UpgradePlanButton() : null,
      onTap: onTap,
    );
  }
}
