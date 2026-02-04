import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_ui_kit/widgets/buttons/chip_button.dart';

void main() {
  testWidgets('Проверка Chip', (WidgetTester tester) async {
    //Создание виджета с статусом chip button on
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            body: ChipButton(
              status: ChipButtonStatus.ON,
              text: 'Популярные',
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    //Нахождение Conteiner'а
    final containerFinder = find.byType(Container);

    //Получение Container'а
    final container = tester.widget<Container>(containerFinder);

    //Получение decoration
    final decoration = container.decoration as BoxDecoration;

    //Проверка сходиться ли с макетом цветом кнопки
    expect(decoration.color, Color.fromRGBO(26, 111, 238, 1));

    // Получение текста кнопки
    final center = container.child as Center;
    final text = center.child as Text;

    //Пооверка сходится ли цвет текста
    expect(text.style?.color, Colors.white);

    //Создание виджета с статусом chip button off
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            body: ChipButton(
              status: ChipButtonStatus.OFF,
              text: 'Популярные',
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    //Нахождение Conteiner'а
    final containerFinder2 = find.byType(Container);

    //Получение Container'а
    final container2 = tester.widget<Container>(containerFinder2);

    //Получение decoration
    final decoration2 = container2.decoration as BoxDecoration;

    //Проверка сходиться ли с макетом цветом кнопки
    expect(decoration2.color, Color.fromRGBO(245, 245, 249, 1));

    // Получение текста кнопки
    final center2 = container2.child as Center;
    final text2 = center2.child as Text;

    //Пооверка сходится ли цвет текста
    expect(text2.style?.color, Color.fromRGBO(126, 126, 154, 1));
  });
}
