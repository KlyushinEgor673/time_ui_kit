import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_ui_kit/time_ui_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCart extends StatelessWidget {
  const CardCart({
    super.key,
    required this.name,
    required this.closeCallback,
    required this.price,
    required this.count,
    required this.minusIsActive,
    required this.minusCallback,
    required this.plusCallback,
  });

  final String name;
  final VoidCallback closeCallback;
  final double price;
  final int count;
  final bool minusIsActive;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return CardBackground(
      child: Stack(
        children: [
          Positioned(
            top: orientation == Orientation.portrait ? 16.h : 16,
            left: orientation == Orientation.portrait ? 16.w : 16,
            child: SizedBox(
              width: orientation == Orientation.portrait ? 303.w : 303,
              height: orientation == Orientation.portrait ? 40.h : 40,
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  height: 20 / 16,
                  letterSpacing: -0.32,
                ),
              ),
            ),
          ),
          Positioned(
            top: orientation == Orientation.portrait ? 16.h : 16,
            right: orientation == Orientation.portrait ? 16.w : 16,
            child: GestureDetector(
              onTap: closeCallback,
              child: SvgPicture.asset(
                'icons/close.svg',
                package: 'tme_ui_kit',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
                color: Color.fromRGBO(126, 126, 154, 1),
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 20.w : 20,
            bottom: orientation == Orientation.portrait ? 20.h : 20,
            child: Text(
              '$price ₽',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                height: 24 / 17,
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            right: orientation == Orientation.portrait ? 115.w : 115,
            bottom: orientation == Orientation.portrait ? 22.h : 22,
            child: Text(
              '$count штук',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: orientation == Orientation.portrait ? 15.sp : 15,
                height: 20 / 15,
              ),
            ),
          ),
          Positioned(
            right: orientation == Orientation.portrait ? 9.w : 9,
            bottom: orientation == Orientation.portrait ? 16.h : 16,
            child: CounterController(
              minusIsActive: minusIsActive,
              minusCallback: minusCallback,
              plusCallback: plusCallback,
            ),
          ),
        ],
      ),
    );
  }
}
