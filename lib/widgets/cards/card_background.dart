import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardBackground extends StatelessWidget {
  const CardBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 335.w : 335,
      height: orientation == Orientation.portrait ? 138.h : 138,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(244, 244, 244, 1), width: 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(228, 232, 245, 0.6),
            offset: Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 0
          )
        ]
      ),
      child: child,
    );
  }
}
