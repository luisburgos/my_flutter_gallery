// ignore_for_file: unused_result
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' hide When;
import 'package:my_flutter_gallery/components/custom_dropwdown.dart';
import 'package:my_flutter_gallery/legacy/clones/llm_model_selector/cubit.dart';
import 'package:my_flutter_gallery/legacy/clones/llm_model_selector/data_model.dart';
import 'package:my_flutter_gallery/legacy/clones/llm_model_selector/service.dart';
import 'package:my_flutter_gallery/legacy/clones/llm_model_selector/view.dart';

import '../helpers/helpers.dart';

void main() {
  testScenario(
    'Component initialization no selection',
    Given(
      'the LLM default options',
      (_) async {
        await _.pumpLLMSelectorView(forceLoad: false);
      },
    ),
    When(
      'finishes initialization',
      (_) async {
        // TODO(unassigned): evaluate remove or refactor
        //await _.rebuild();
      },
    ),
    Then(
      'hint text is shown',
      (_) async {
        _.hasCustomDropdownButtonWithText('Select one');
      },
    ),
  );

  testScenario(
    'Display options list',
    Given(
      'the LLM default options'
      '\n AND LLMSelectorView is initialized',
      (_) async {
        await _.pumpLLMSelectorView(forceLoad: true);
      },
    ),
    When(
      'the dropdown button is tap',
      (_) async {
        await _.tapOnDropdownButton();
      },
    ),
    Then(
      'the options list is displayed',
      (_) async {
        _
          ..hasCustomDropdownOptionsListItemWithText('Model A 3.5')
          ..hasCustomDropdownOptionsListItemWithText('Model A 4.0')
          ..hasCustomDropdownOptionsListItemWithText('Model B 1.0 Pro')
          ..hasCustomDropdownOptionsListItemWithText('Model B 1.5 Pro');
      },
    ),
  );

  testScenario(
    'First selection',
    Given(
      'the LLM default options'
      '\n AND LLMSelectorView is initialized',
      (_) async {
        await _.pumpLLMSelectorView(forceLoad: true);
        await _.tapOnDropdownButton();
      },
    ),
    When(
      'Model A 3.5 is selected',
      (_) async {
        await _.tapOnDropdownOptionsListItemWithText('Model A 3.5');
      },
    ),
    Then(
      'Model A 3.5 is shown',
      (_) async {
        _.hasCustomDropdownOptionsListItemWithText('Model A 3.5');
      },
    ),
  );

  testScenario(
    'Change current selection',
    Given(
      'the LLM default options'
      '\n AND LLMSelectorView is initialized',
      (_) async {
        await _.pumpLLMSelectorView(forceLoad: true);
        await _.tapOnDropdownButton();
      },
    ),
    When(
      'Model B 1.0 Pro is selected',
      (_) async {
        await _.tapOnDropdownOptionsListItemWithText('Model A 4.0');
      },
    ),
    Then(
      'Model B 1.0 Pro is shown',
      (_) async {
        _.hasCustomDropdownButtonWithText('Model A 4.0');
      },
    ),
  );

  testScenario(
    'Select option not included on current subscription plan',
    Given(
      'the LLM default options'
      '\n AND Model B 1.0 Pro is selected'
      '\n AND options list is displayed',
      (_) async {
        await _.pumpLLMSelectorView(forceLoad: true);
        await _.tapOnDropdownButton();
        await _.tapOnDropdownOptionsListItemWithText('Model B 1.0 Pro');
      },
    ),
    When(
      'select Model A 4.0',
      (_) async {
        await _.tapOnDropdownOptionsListItemWithText('Model A 4.0');
      },
    ),
    Then(
      'Model A 4.0 is shown WHERE?',
      (_) async {
        _.hasCustomDropdownButtonWithText('Model A 4.0');
      },
    ),
  );
}

extension _CustomDropdownRobot on WidgetTester {
  Future<void> pumpLLMSelectorView({
    required bool forceLoad,
  }) async {
    final mockService = MockLLMService();
    final cubit = LLMOptionCubit(optionsService: mockService);
    when(
      mockService.getAll,
    ).thenAnswer(
      (_) async => [
        const LLMDataModel(
          name: 'Model A',
          description: '',
          version: '3.5',
          type: '',
        ),
        const LLMDataModel(
          name: 'Model A',
          description: '',
          version: '4.0',
          type: '',
        ),
        const LLMDataModel(
          name: 'Model B',
          description: '',
          version: '1.0 Pro',
          type: '',
        ),
        const LLMDataModel(
          name: 'Model B',
          description: '',
          version: '1.5 Pro',
          type: '',
        ),
      ],
    );

    when(
      mockService.getRemoteConfig,
    ).thenAnswer(
      (_) async => const LLMRemoteConfig(),
    );

    if (forceLoad) {
      await cubit.load();
    }
    await pumpApp(
      Scaffold(
        body: BlocProvider(
          create: (_) => cubit,
          child: const LLMSelectorView(),
        ),
      ),
    );
  }

  Future<void> tapOnDropdownButton() async {
    final finder = find.byType(CustomDropdownButton);
    await tap(finder);
    await rebuild();
  }

  Future<void> tapOnDropdownOptionsListItemWithText(
    String optionName,
  ) async {
    final finder = find.widgetWithText(
      CustomDropdownOptionsListItem,
      optionName,
    );
    await tap(finder);
    await rebuild();
  }

  void hasCustomDropdownOptionsListItemWithText(String text) {
    isA<CustomDropdownOptionsListItem>().having(
      (_) => _.title as Text,
      'data',
      text,
    );
  }

  void hasCustomDropdownButtonWithText(String text) {
    isA<CustomDropdownButton>().having(
      (_) => _.child! as Text,
      'data',
      text,
    );
  }
}

class MockLLMService extends Mock implements LLMService {}
