import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_ui_kit/time_ui_kit.dart';

void main() {
  testWidgets('Проверка параметров инпута', (WidgetTester tester) async {
    //Создание виджета
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Input(
            errorText: 'Введите коректное имя',
            hintText: 'Имя',
            controller: TextEditingController(),
            isPassword: false,
          ),
        ),
      ),
    );

    //Нахождение контенера Input'a
    final containerFinder = find.byType(Container).first;

    //Получение Container
    final container = tester.widget<Container>(containerFinder);

    //Получение decoraion из Container'а
    final decoration = container.decoration as BoxDecoration;

    //Проверка заднего фона
    expect(decoration.color, Color.fromRGBO(245, 245, 249, 1));

    //Проверка обводки
    expect(decoration.border?.top.color, Color.fromRGBO(235, 235, 235, 1));

    //Нахождение TextField
    final textFieldFinder = find.byType(TextField).first;

    //Получение TextField
    final textField = tester.widget<TextField>(textFieldFinder);

    //Поучение FocusNode TextField'а
    final focusNode = textField.focusNode;

    //Фокус в TextField
    await tester.tap(textFieldFinder);
    await tester.pump();

    //Убирание фокуса из TextField
    focusNode?.unfocus();
    await tester.pump();

    //Нахождение Text
    final textFinder = find.byType(Text).last;

    //Получение text
    final text = tester.widget<Text>(textFinder);

    //Проверка появилась ли ошибка что поле не заполнено
    expect(text.data, 'Введите коректное имя');

    //Проверка цвета ошибка
    expect(text.style?.color, Color.fromRGBO(253, 53, 53, 1));
  });
}
