import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_ui_kit/time_ui_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderDown extends StatelessWidget {
  const HeaderDown({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: orientation == Orientation.portrait ? 84.h : 84,
      child: Stack(
        children: [
          Positioned(top: 0, left: 0, child: BackBubble(onTap: () {})),
          Positioned(
            top: orientation == Orientation.portrait ? 11.h : 11,
            right: orientation == Orientation.portrait ? 11.w : 11,
            child: SvgPicture.asset(
              'icons/delete.svg',
              package: 'time_ui_kit',
              height: orientation == Orientation.portrait ? 20.h : 20,
              width: orientation == Orientation.portrait ? 20.w : 20,
              color: Color.fromRGBO(184, 193, 204, 1),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24.sp,
                height: 28 / 24,
                letterSpacing: 0.33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
