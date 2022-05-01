import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('to test the widgets from the Homepage', () {
    testWidgets(
      "the 'from' textfield should be empty",
      (WidgetTester tester) async {
        tester.pumpAndSettle();
        expect(
            tester.getSemantics(
              find.byKey(const Key('textField')),
            ),
            matchesSemantics(value: ''));
      },
    );
    testWidgets(
      "the from dropdown should be in 'real' as default",
      (WidgetTester tester) async {
        tester.pumpAndSettle();
        expect();
      },
    );
  });
}
