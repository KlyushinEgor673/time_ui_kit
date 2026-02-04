import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_ui_kit/time_ui_kit.dart';

void main() {
  testWidgets('Проверка Select', (WidgetTester tester) async {
    //Создание виджета
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Select(
            items: ['Мужской', 'Женский'],
            title: 'Пол',
            changeValue: (newValue) {},
          ),
        ),
      ),
    );

    //Нахождение GestureDetector'a
    final gestureDetectorFinder = find.byType(GestureDetector).first;

    //Произведение клика на Container
    await tester.tap(gestureDetectorFinder);
    await tester.pump();

    //Нахождение BottomSheet
    expect(find.byType(BottomSheet).first, findsOneWidget);
  });
}
