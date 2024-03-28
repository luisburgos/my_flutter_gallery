import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart' show isTest;
import 'package:my_flutter_gallery/clones/llm_model_selector/cubit.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/service.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/view.dart';
import 'package:my_flutter_gallery/shared/custom_dropwdown.dart';

import '../helpers/pump_app.dart';

void main() {
  late LLMOptionCubit cubit;
  late LLMService service;

  setUp(() {
    service = DefaultLLMService();
    cubit = LLMOptionCubit(optionsService: service);
  });

  testScenario(
    'GIVEN the LLM default options \n'
    'WHEN finishes initialization \n'
    'THEN hint text is shown',
    given: (_) async {
      await pumpLLMSelectorView(_, cubit);
    },
    when: (_) async {
      await cubit.load();
      await rebuild(_);
    },
    then: (_) async {
      expect(find.text('Select one'), findsOneWidget);
    },
  );

  testScenario(
    'GIVEN the LLM default options'
    ' AND LLMSelectorView is initialized \n'
    'WHEN the dropdown is tap \n'
    'THEN the options list is displayed',
    given: (_) async {
      await pumpLLMSelectorView(_, cubit);
    },
    when: (_) async {
      final buttonWidgetFinder = find.text('Select one');
      await _.tap(buttonWidgetFinder);
      await rebuild(_);
    },
    then: (_) async {
      expect(find.text('ChatGPT - 3.5'), findsOneWidget);
      expect(find.text('ChatGPT - 4.0'), findsOneWidget);
      expect(find.text('Gemini - 1.0 Pro'), findsOneWidget);
      expect(find.text('Gemini - 1.5 Pro'), findsOneWidget);
    },
  );

  testScenario(
    'GIVEN the LLM default options'
    ' AND LLMSelectorView is initialized \n'
    'WHEN ChatGPT 3.5 is selected \n'
    'THEN ChatGPT 3.5 is shown',
    given: (_) async {
      await pumpLLMSelectorView(_, cubit);
    },
    when: (_) async {
      cubit.setSelected(chatGpt3dot5);
      await rebuild(_);
    },
    then: (_) async {
      expect(find.text('ChatGPT - 3.5'), findsOneWidget);
    },
  );

  testScenario(
    'GIVEN the LLM default options'
    ' AND LLMSelectorView is initialized \n'
    'WHEN Gemini - 1.0 Pro is selected \n'
    'THEN Gemini - 1.0 Pro is shown',
    given: (_) async {
      await pumpLLMSelectorView(_, cubit);
      final buttonWidgetFinder = find.byType(ButtonWidget);
      await _.tap(buttonWidgetFinder);
      await rebuild(_);
    },
    when: (_) async {
      // Find item list element with label or selected actually
      final widgetFinder = find.text('ChatGPT - 4.0');
      await _.tap(widgetFinder);
      await rebuild(_);
    },
    then: (_) async {
      isA<ButtonWidget>().having(
        (t) => t.child! as Text,
        'data',
        'ChatGPT - 4.0',
      );
    },
  );

  // TODO(unassigned): change descriptions
  testScenario2(
    given: _Given(
      'GIVEN the LLM default options'
      ' AND LLMSelectorView is initialized',
      (_) async {
        await pumpLLMSelectorView(_, cubit);
        cubit.setSelected(gemini1dot0Pro);
        await rebuild(_);
      },
    ),
    when: _When(
      'WHEN Gemini - 1.0 Pro is selected',
      (_) async {
        final widgetFinder = find.text('Gemini - 1.0 Pro');
        await _.tap(widgetFinder);
        await rebuild(_);
      },
    ),
    then: _Then(
      'THEN Gemini - 1.0 Pro is shown',
      (_) async {
        isA<ButtonWidget>().having(
          (t) => t.child! as Text,
          'data',
          'Gemini - 1.0 Pro',
        );
      },
    ),
  );
}

Future<void> rebuild(WidgetTester tester) async {
  await tester.pump();
}

Future<void> pumpLLMSelectorView(
  WidgetTester tester,
  LLMOptionCubit cubit,
) async {
  await tester.pumpApp(
    Scaffold(
      body: BlocProvider(
        create: (_) => cubit,
        child: const LLMSelectorView(),
      ),
    ),
  );
}

@isTest
Future<void> testScenario(
  String description, {
  required WidgetTesterCallback given,
  required WidgetTesterCallback when,
  required WidgetTesterCallback then,
}) async {
  testWidgets(
    description,
    (tester) async {
      await given.call(tester);
      await when.call(tester);
      await then.call(tester);
    },
  );
}

@isTest
Future<void> testScenario2({
  // ignore: library_private_types_in_public_api
  required _Given given,
  // ignore: library_private_types_in_public_api
  required _When when,
  // ignore: library_private_types_in_public_api
  required _Then then,
}) async {
  testWidgets(
    '${given.description} \n'
    '${when.description} \n'
    '${then.description}',
    (tester) async {
      debugPrint(given.description);
      await given.callback.call(tester);
      debugPrint(when.description);
      await when.callback.call(tester);
      debugPrint(then.description);
      await then.callback.call(tester);
    },
  );
}

class _Given {
  _Given(
    this.description,
    this.callback,
  );

  final String description;
  final WidgetTesterCallback callback;
}

class _When {
  _When(
    this.description,
    this.callback,
  );

  final String description;
  final WidgetTesterCallback callback;
}

class _Then {
  _Then(
    this.description,
    this.callback,
  );

  final String description;
  final WidgetTesterCallback callback;
}
