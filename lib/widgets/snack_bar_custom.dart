import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SnackBarCustom extends StatelessWidget {
  const SnackBarCustom({super.key, required this.text, required this.closeCallback});

  final String text;
  final VoidCallback closeCallback;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 335.w : 335,
      height: orientation == Orientation.portrait ? 120.h : 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: orientation == Orientation.portrait ? 24.h : 24,
            left: orientation == Orientation.portrait ? 20.w : 20,
            child: SizedBox(
              width: orientation == Orientation.portrait ? 267.w : 267,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: orientation == Orientation.portrait ? 20.sp : 20,
                  fontWeight: FontWeight.w800,
                  height: 28 / 20,
                  letterSpacing: 0.38,
                ),
              ),
            ),
          ),
          Positioned(
            top: orientation == Orientation.portrait ? -12.h : -12,
            right: orientation == Orientation.portrait ? -12.w : -12,
            child: GestureDetector(
              onTap: closeCallback,
              child: SvgPicture.asset(
                'icons/blue-dismiss.svg',
                package: 'time_ui_kit',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
