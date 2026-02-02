import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackBubble extends StatelessWidget {
  const BackBubble({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: orientation == Orientation.portrait ? 32.h : 32,
        width: orientation == Orientation.portrait ? 32.w : 32,
        decoration: BoxDecoration(
          color: Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SvgPicture.asset(
            'icons/chevron-left.svg',
            package: 'time_ui_kit',
            color: Color.fromRGBO(126, 126, 154, 1),
            height: orientation == Orientation.portrait ? 20.h : 20,
            width: orientation == Orientation.portrait ? 20.h : 20,
          ),
        ),
      ),
    );
  }
}
