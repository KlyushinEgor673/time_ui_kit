import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BigButtonColor { blue, lightBlue, white, gray }

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.color,
    required this.onTap,
    required this.text,
  });

  final BigButtonColor color;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: orientation == Orientation.portrait ? 335.w : 335,
        height: orientation == Orientation.portrait ? 56.h : 56,
        decoration: BoxDecoration(
          color: color == BigButtonColor.blue
              ? Color.fromRGBO(26, 111, 238, 1)
              : color == BigButtonColor.lightBlue
              ? Color.fromRGBO(201, 212, 251, 1)
              : color == BigButtonColor.white
              ? Colors.white
              : Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(10),
          border: color == BigButtonColor.white
              ? Border.all(color: Color.fromRGBO(26, 111, 238, 1), width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
              height: 24 / 17,
              letterSpacing: 0,
              color:
                  color == BigButtonColor.blue ||
                      color == BigButtonColor.lightBlue
                  ? Colors.white
                  : color == BigButtonColor.white
                  ? Color.fromRGBO(26, 111, 238, 1)
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
