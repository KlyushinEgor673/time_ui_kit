import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({
    super.key,
    required this.activeIndex,
    required this.zeroCallback,
    required this.oneCallback,
    required this.twoCallback,
    required this.threeCallback,
  });

  final int activeIndex;
  final VoidCallback zeroCallback;
  final VoidCallback oneCallback;
  final VoidCallback twoCallback;
  final VoidCallback threeCallback;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: orientation == Orientation.portrait ? 88.h : 88,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -0.5),
            blurRadius: 0,
            spreadRadius: 0,
            color: Color.fromRGBO(160, 160, 160, 0.3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: orientation == Orientation.portrait ? 8.h : 8,
          left: orientation == Orientation.portrait ? 7.h : 7,
          right: orientation == Orientation.portrait ? 7.h : 7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: zeroCallback,
              child: SizedBox(
                width: orientation == Orientation.portrait ? 76.w : 76,
                height: orientation == Orientation.portrait ? 49.w : 49,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SvgPicture.asset(
                          'icons/home.svg',
                          package: 'time_ui_kit',
                          height: orientation == Orientation.portrait
                              ? 32.h
                              : 32,
                          width: orientation == Orientation.portrait
                              ? 32.w
                              : 32,
                          color: activeIndex == 0
                              ? Color.fromRGBO(26, 111, 238, 1)
                              : Color.fromRGBO(184, 193, 204, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: orientation == Orientation.portrait ? 1.h : 1,
                      child: Center(
                        child: Text(
                          'Главная',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: orientation == Orientation.portrait
                                ? 12.sp
                                : 12,
                            height: 16 / 12,
                            letterSpacing: 0,
                            color: activeIndex == 0
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: oneCallback,
              child: SizedBox(
                width: orientation == Orientation.portrait ? 76.w : 76,
                height: orientation == Orientation.portrait ? 49.w : 49,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SvgPicture.asset(
                          'icons/catalog.svg',
                          package: 'time_ui_kit',
                          height: orientation == Orientation.portrait
                              ? 32.h
                              : 32,
                          width: orientation == Orientation.portrait
                              ? 32.w
                              : 32,
                          color: activeIndex == 1
                              ? Color.fromRGBO(26, 111, 238, 1)
                              : Color.fromRGBO(184, 193, 204, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: orientation == Orientation.portrait ? 1.h : 1,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Каталог',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: orientation == Orientation.portrait
                                ? 12.sp
                                : 12,
                            height: 16 / 12,
                            letterSpacing: 0,
                            color: activeIndex == 1
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: twoCallback,
              child: SizedBox(
                width: orientation == Orientation.portrait ? 76.w : 76,
                height: orientation == Orientation.portrait ? 49.w : 49,
                child: Stack(
                  children: [
                    Positioned(
                      top: orientation == Orientation.portrait ? 5.h : 5,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SvgPicture.asset(
                          'icons/projects.svg',
                          package: 'time_ui_kit',
                          height: orientation == Orientation.portrait
                              ? 24.h
                              : 24,
                          width: orientation == Orientation.portrait
                              ? 24.w
                              : 24,
                          color: activeIndex == 2
                              ? Color.fromRGBO(26, 111, 238, 1)
                              : Color.fromRGBO(184, 193, 204, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: orientation == Orientation.portrait ? 1.h : 1,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Проекты',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: orientation == Orientation.portrait
                                ? 12.sp
                                : 12,
                            height: 16 / 12,
                            letterSpacing: 0,
                            color: activeIndex == 2
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: threeCallback,
              child: SizedBox(
                width: orientation == Orientation.portrait ? 76.w : 76,
                height: orientation == Orientation.portrait ? 49.w : 49,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SvgPicture.asset(
                          'icons/profile.svg',
                          package: 'time_ui_kit',
                          height: orientation == Orientation.portrait
                              ? 32.h
                              : 32,
                          width: orientation == Orientation.portrait
                              ? 32.w
                              : 32,
                          color: activeIndex == 2
                              ? Color.fromRGBO(26, 111, 238, 1)
                              : Color.fromRGBO(184, 193, 204, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: orientation == Orientation.portrait ? 1.h : 1,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Профиль',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: orientation == Orientation.portrait
                                ? 12.sp
                                : 12,
                            height: 16 / 12,
                            letterSpacing: 0,
                            color: activeIndex == 2
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
