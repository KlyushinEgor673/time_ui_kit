import 'package:flutter/material.dart';
import 'package:time_ui_kit/time_ui_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPrimary extends StatelessWidget {
  const CardPrimary({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.isAdded,
    required this.onTap,
  });

  final String name;
  final String category;
  final double price;
  final bool isAdded;
  final VoidCallback onTap;

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
            left: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 44.h : 44,
            child: Text(
              category,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(147, 147, 150, 1),
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 16.h : 16,
            child: Text(
              '$price ₽',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                height: 24 / 17,
                letterSpacing: 0,
              ),
            ),
          ),
          Positioned(
            right: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 16.h : 16,
            child: SmallButton(
              color: isAdded ? SmallButtonColor.white : SmallButtonColor.blue,
              text: isAdded ? 'Убрать' : 'Добавить',
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
