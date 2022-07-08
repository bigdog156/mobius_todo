// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobiustodoapp/main.dart';

void main() {

  testWidgets('Open todo app', (WidgetTester tester) async {

    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('Create Todo ...'), findsOneWidget);
    expect(find.text('Todo blabla'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Add'), findsNothing);
  });

  testWidgets('Add todo', (WidgetTester tester) async {

    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    await tester.tap(find.byIcon(Icons.add));

    await tester.pump();

    expect(find.text('Add'), findsNothing);

    tester.testTextInput.enterText('add todo');
    tester.testTextInput.closeConnection();
    await tester.pump();
    await tester.tap(find.text('Add'));
    await tester.pump();
    expect(find.byType(Checkbox), findsOneWidget);

  });


}
