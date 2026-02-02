import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterController extends StatelessWidget {
  const CounterController({super.key, required this.minusIsActive, required this.minusCallback, required this.plusCallback});

  final bool minusIsActive;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 64.w : 64,
      height: orientation == Orientation.portrait ? 32.h : 32,
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 249, 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: orientation == Orientation.portrait ? 6.w : 6,
          vertical: orientation == Orientation.portrait ? 6.h : 6,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: minusCallback,
              child: SvgPicture.asset(
                'icons/minus.svg',
                package: 'time_ui_kit',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
                color: minusIsActive
                    ? Color.fromRGBO(147, 147, 150, 1)
                    : Color.fromRGBO(184, 193, 204, 1),
              ),
            ),
            Container(
              height: orientation == Orientation.portrait ? 16.h : 16,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(235, 235, 235, 1),
                ),
              ),
            ),
            GestureDetector(
              onTap: plusCallback,
              child: SvgPicture.asset(
                'icons/plus.svg',
                package: 'time_ui_kit',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
                color: Color.fromRGBO(147, 147, 150, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
