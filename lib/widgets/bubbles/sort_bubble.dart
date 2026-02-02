import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortBubble extends StatelessWidget {
  const SortBubble({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: orientation == Orientation.portrait ? 48.w : 48,
        height: orientation == Orientation.portrait ? 48.h : 48,
        decoration: BoxDecoration(
          color: Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SvgPicture.asset(
            'icons/filter.svg',
            package: 'time_ui_kit',
            color: Color.fromRGBO(126, 126, 154, 1),
            height: orientation == Orientation.portrait ? 20.h : 20,
            width: orientation == Orientation.portrait ? 20.w : 20,
          ),
        ),
      ),
    );
  }
}
