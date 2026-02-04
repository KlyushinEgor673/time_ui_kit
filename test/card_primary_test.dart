import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_ui_kit/time_ui_kit.dart';

void main() {
  testWidgets('провекта card primary', (WidgetTester tester) async {
    //Создание card primary в статусе add
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            body: CardPrimary(
              name: 'Рубашка Воскресенье для машинного вязания',
              category: 'Мужская одежда',
              price: 300,
              isAdded: false,
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    //Находжение кнопки
    final smallButtonFinder = find.byType(SmallButton).first;

    //Получение кнопки
    final smallButton = tester.widget<SmallButton>(smallButtonFinder);

    //Сравнение кнопки с макетом
    expect(smallButton.color, SmallButtonColor.blue);

    //Создание card primary в статусе delete
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            body: CardPrimary(
              name: 'Рубашка Воскресенье для машинного вязания',
              category: 'Мужская одежда',
              price: 300,
              isAdded: true,
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    //Находжение кнопки
    final smallButtonFinder2 = find.byType(SmallButton).first;

    //Получение кнопки
    final smallButton2 = tester.widget<SmallButton>(smallButtonFinder2);

    //Сравнение кнопки с макетом
    expect(smallButton2.color, SmallButtonColor.white);
  });
}
