import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ChipButtonColor { blue, gray }

class ChipButton extends StatelessWidget {
  const ChipButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
  });

  final ChipButtonColor color;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: orientation == Orientation.portrait ? 129.w : 129,
        height: orientation == Orientation.portrait ? 48.h : 48,
        decoration: BoxDecoration(
          color: color == ChipButtonColor.blue
              ? Color.fromRGBO(26, 111, 238, 1)
              : Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text.length > 8 ? '${text.substring(0, 7)}...' : text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              height: 20 / 14,
              letterSpacing: 0,
              color: color == ChipButtonColor.blue
                  ? Colors.white
                  : Color.fromRGBO(126, 126, 154, 1),
            ),
          ),
        ),
      ),
    );
  }
}
