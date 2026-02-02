import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_ui_kit/time_ui_kit.dart';

class HeaderUp extends StatelessWidget {
  const HeaderUp({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: orientation == Orientation.portrait ? 48.h : 48,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: orientation == Orientation.portrait ? 20.w : 20,
            child: BackBubble(onTap: () {}),
          ),
          Positioned(
            top: orientation == Orientation.portrait ? 2.h : 2,
            left: 0,
            right: 0,
            child: Center(child: Text(text, style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              height: 28 / 20,
              letterSpacing: 0.38,
            ))),
          ),
          Positioned(
            top: orientation == Orientation.portrait ? 6.h : 6,
            right: orientation == Orientation.portrait ? 26.w : 26,
            child: SvgPicture.asset(
              'icons/delete.svg',
              package: 'time_ui_kit',
              height: orientation == Orientation.portrait ? 20.h : 20,
              width: orientation == Orientation.portrait ? 20.w : 20,
              color: Color.fromRGBO(184, 193, 204, 1),
            ),
          ),
        ],
      ),
    );
  }
}
