// ignore_for_file: unused_result
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' hide When;
import 'package:my_flutter_gallery/clones/llm_model_selector/cubit.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/service.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/view.dart';
import 'package:my_flutter_gallery/shared/custom_dropwdown.dart';

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
          ..hasCustomDropdownOptionsListItemWithText('ChatGPT - 3.5')
          ..hasCustomDropdownOptionsListItemWithText('ChatGPT - 4.0')
          ..hasCustomDropdownOptionsListItemWithText('Gemini - 1.0 Pro')
          ..hasCustomDropdownOptionsListItemWithText('Gemini - 1.5 Pro');
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
      'ChatGPT 3.5 is selected',
      (_) async {
        await _.tapOnDropdownOptionsListItemNamed('ChatGPT - 3.5');
      },
    ),
    Then(
      'ChatGPT 3.5 is shown',
      (_) async {
        _.hasCustomDropdownOptionsListItemWithText('ChatGPT - 3.5');
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
      'Gemini - 1.0 Pro is selected',
      (_) async {
        await _.tapOnDropdownOptionsListItemNamed('ChatGPT - 4.0');
      },
    ),
    Then(
      'Gemini - 1.0 Pro is shown',
      (_) async {
        _.hasCustomDropdownButtonWithText('ChatGPT - 4.0');
      },
    ),
  );

  testScenario(
    'Select option not included on current subscription plan',
    Given(
      'the LLM default options'
      '\n AND Gemini - 1.0 Pro is selected'
      '\n AND options list is displayed',
      (_) async {
        await _.pumpLLMSelectorView(forceLoad: true);
        await _.tapOnDropdownButton();
        await _.tapOnDropdownOptionsListItemNamed('Gemini - 1.0 Pro');
      },
    ),
    When(
      'select ChatGPT - 4.0',
      (_) async {
        await _.tapOnDropdownOptionsListItemNamed('ChatGPT - 4.0');
      },
    ),
    Then(
      'ChatGPT - 4.0 is shown WHERE?',
      (_) async {
        _.hasCustomDropdownButtonWithText('ChatGPT - 4.0');
      },
    ),
  );
}

extension _CustomDropdownRobot on WidgetTester {
  Future<void> pumpLLMSelectorView({
    required bool forceLoad,
  }) async {
    final mockService = MockLLMService();
    final cubit = LLMOptionCubit(
      optionsService: mockService,
    );
    when(
      mockService.getAll,
    ).thenAnswer(
      (_) async => [
        chatGpt3dot5,
        chatGpt4dot0,
        gemini1dot0Pro,
        gemini1dot5Pro,
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

  Future<void> tapOnDropdownOptionsListItemNamed(
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
