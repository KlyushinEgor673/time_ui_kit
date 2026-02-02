import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SmallButtonColor { blue, lightBlue, white, gray }

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
  });

  final SmallButtonColor color;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: orientation == Orientation.portrait ? 96.w : 96,
        height: orientation == Orientation.portrait ? 40.h : 40,
        decoration: BoxDecoration(
          color: color == SmallButtonColor.blue
              ? Color.fromRGBO(26, 111, 238, 1)
              : color == SmallButtonColor.lightBlue
              ? Color.fromRGBO(201, 212, 251, 1)
              : color == SmallButtonColor.white
              ? Colors.white
              : Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(10),
          border: color == SmallButtonColor.white
              ? Border.all(color: Color.fromRGBO(26, 111, 238, 1), width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            text.length > 8 ? '${text.substring(0, 7)}...' : text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              height: 20 / 14,
              letterSpacing: 0,
              color:
                  color == SmallButtonColor.blue ||
                      color == SmallButtonColor.lightBlue
                  ? Colors.white
                  : color == SmallButtonColor.white
                  ? Color.fromRGBO(26, 111, 238, 1)
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
