// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flashcards/main.dart';
import 'package:flashcards/sections/sections_pager.dart';

void main() {


  //we should add sections repository before being able to test it
  testWidgets('Sections Test', (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(textDirection: TextDirection.ltr,
        child: MyApp()));
    expect(find.text('Test1'), findsOneWidget);
    expect(find.text('Test2'), findsNothing);
//    await tester.drag(find.byType(SectionPage), const Offset(-50, 0));
//    expect(find.text('Test1'), findsOneWidget);
//    expect(find.text('Test1'), findsNothing);
  });
}
