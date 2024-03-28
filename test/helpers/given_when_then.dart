import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart' show isTest;

@isTest
Future<void> testScenario(
  String description,
  Given given,
  When when,
  Then then,
) async {
  testWidgets(
    description,
    (tester) async {
      debugPrint('SCENARIO: $description\n');
      debugPrint('GIVEN ${given.description}');
      await given.callback.call(tester);
      debugPrint('WHEN ${when.description}');
      await when.callback.call(tester);
      debugPrint('THEN ${then.description}\n\n');
      await then.callback.call(tester);
    },
  );
}

class Given {
  const Given(
    this.description,
    this.callback,
  );

  final String description;
  final WidgetTesterCallback callback;
}

class When {
  const When(
    this.description,
    this.callback,
  );

  final String description;
  final WidgetTesterCallback callback;
}

class Then {
  const Then(
    this.description,
    this.callback,
  );

  final String description;
  final WidgetTesterCallback callback;
}
