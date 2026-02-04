import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_ui_kit/time_ui_kit.dart';

void main() {
  testWidgets('Проверка tabbar', (WidgetTester tester) async {
    //Создание tabbar
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            bottomNavigationBar: Tabbar(
              activeIndex: 0,
              zeroCallback: () {},
              oneCallback: () {},
              twoCallback: () {},
              threeCallback: () {},
            ),
          ),
        ),
      ),
    );

    //Нахождение GestureDetector
    final gestureDetectorFinder = find.byType(GestureDetector).last;

    //получение координат
    final center = tester.getCenter(gestureDetectorFinder);

    //Фокусировка на кнопке
    await tester.startGesture(center);
    await tester.pump();

    //Получение иконки кнопки
    final svgPictureFinder = find.byType(SvgPicture).last;
    final svgPicture = tester.widget<SvgPicture>(svgPictureFinder);

    //Проверка цвета иконки
    expect(
      svgPicture.colorFilter,
      ColorFilter.mode(Color.fromRGBO(26, 111, 238, 1), BlendMode.srcIn),
    );
  });
}
