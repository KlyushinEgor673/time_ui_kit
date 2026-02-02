import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleController extends StatefulWidget {
  const ToggleController({super.key, required this.isActive});

  final bool isActive;

  @override
  State<ToggleController> createState() => _ToggleControllerState();
}

class _ToggleControllerState extends State<ToggleController> {
  late bool _isActive;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isActive = widget.isActive;
  }
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      child: Container(
        width: orientation == Orientation.portrait ? 48.w : 48,
        height: orientation == Orientation.portrait ? 28.h : 28,
        decoration: BoxDecoration(
          color: _isActive ? Color.fromRGBO(26, 111, 238, 1) : Color.fromRGBO(235, 235, 235, 1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              top: 0,
              bottom: 0,
              left: _isActive ? null : orientation == Orientation.portrait ? 2.w : 2,
              right: _isActive ? orientation == Orientation.portrait ? 2.w : 2  : null,
              child: Container(
                height: orientation == Orientation.portrait ? 24.h : 24,
                width: orientation == Orientation.portrait ? 24.h : 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        setState(() {
          _isActive =! _isActive;
        });
      },
    );
  }
}
