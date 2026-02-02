import 'package:flutter/material.dart';
import 'package:time_ui_kit/time_ui_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProject extends StatelessWidget {
  const CardProject({super.key, required this.name, required this.lastDays, required this.onTap});

  final String name;
  final int lastDays;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return CardBackground(
      child: Stack(
        children: [
          Positioned(
            left: orientation == Orientation.portrait ? 16.w : 16,
            top: orientation == Orientation.portrait ? 16.h : 16,
            child: SizedBox(
              width: orientation == Orientation.portrait ? 303.w : 303,
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                  height: 20 / 16,
                  letterSpacing: -0.32,
                ),
              ),
            ),
          ),
          Positioned(
            left: orientation == Orientation.portrait ? 16.w : 16,
            bottom: orientation == Orientation.portrait ? 20.h : 20,
            child: Text('Прошло $lastDays дня', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: orientation == Orientation.portrait ? 14.sp : 14,
              height: 20 / 14,
              letterSpacing: 0
            )),
          ),
          Positioned(
            right: orientation == Orientation.portrait ? 16.w : 16,
              bottom: orientation == Orientation.portrait ? 16.h : 16,
              child: SmallButton(color: SmallButtonColor.blue, text: 'Открыть', onTap: onTap))
        ],
      ),
    );
  }
}
