import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key, required this.isVk, required this.onTap});

  final bool isVk;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: orientation == Orientation.portrait ? 335.w : 335,
        height: orientation == Orientation.portrait ? 60.h : 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color.fromRGBO(235, 235, 235, 1), width: 1),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                isVk ? 'icons/vk.svg' : 'icons/yandex.svg',
                package: 'time_ui_kit',
                height: orientation == Orientation.portrait ? 32.h : 32,
                width: orientation == Orientation.portrait ? 32.w : 32,
              ),
              SizedBox(width: orientation == Orientation.portrait ? 16.w : 16,),
              Text(
                isVk ? 'Войти с VK' : 'Войти с Yandex',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp,
                  height: 24 / 17,
                  letterSpacing: 0,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
