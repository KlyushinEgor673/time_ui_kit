import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tabbar extends StatefulWidget {
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
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  late int _activeIndex;
  late int _oldIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activeIndex = widget.activeIndex;
    _oldIndex = _activeIndex;
  }

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
              onTap: widget.zeroCallback,
              onTapDown: (_) {
                setState(() {
                  _oldIndex = _activeIndex;
                  _activeIndex = 0;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _activeIndex = _oldIndex;
                });
              },
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
                          colorFilter: ColorFilter.mode(
                            _activeIndex == 0
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                            BlendMode.srcIn,
                          ),
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
                            color: _activeIndex == 0
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
              onTap: widget.oneCallback,
              onTapDown: (_) {
                setState(() {
                  _oldIndex = _activeIndex;
                  _activeIndex = 1;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _activeIndex = _oldIndex;
                });
              },
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
                          colorFilter: ColorFilter.mode(
                            _activeIndex == 1
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                            BlendMode.srcIn,
                          ),
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
                            color: _activeIndex == 1
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
              onTap: widget.twoCallback,
              onTapDown: (_) {
                setState(() {
                  _oldIndex = _activeIndex;
                  _activeIndex = 2;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _activeIndex = _oldIndex;
                });
              },
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
                          colorFilter: ColorFilter.mode(
                            _activeIndex == 2
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                            BlendMode.srcIn,
                          ),
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
                            color: _activeIndex == 2
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
              onTap: widget.threeCallback,
              onTapDown: (_) {
                setState(() {
                  _oldIndex = _activeIndex;
                  _activeIndex = 3;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _activeIndex = _oldIndex;
                });
              },
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
                          colorFilter: ColorFilter.mode(
                            _activeIndex == 3
                                ? Color.fromRGBO(26, 111, 238, 1)
                                : Color.fromRGBO(184, 193, 204, 1),
                            BlendMode.srcIn,
                          ),
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
                            color: _activeIndex == 3
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
