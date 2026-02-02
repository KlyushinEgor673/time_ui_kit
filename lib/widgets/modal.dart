import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Modal extends StatelessWidget {
  const Modal({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 375.w : 375,
      height: orientation == Orientation.portrait ? 164.h : 164,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: orientation == Orientation.portrait ? 24.h : 24,
            left: orientation == Orientation.portrait ? 20.w : 20,
            child: SizedBox(
              width: orientation == Orientation.portrait ? 267.w : 267,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: orientation == Orientation.portrait ? 20.sp : 20,
                  height: 28 / 20,
                  letterSpacing: 0.38,
                ),
              ),
            ),
          ),
          Positioned(
            top: orientation == Orientation.portrait ? 24.h : 24,
            right: orientation == Orientation.portrait ? 20.w : 20,
            child: GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                'icons/dismiss.svg',
                package: 'time_ui_kit',
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
