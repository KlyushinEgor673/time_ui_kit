import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.title,
    required this.errorText,
    required this.hintText,
    required this.controller,
    required this.isPassword,
  });

  final String? title;
  final String errorText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final _focusedNode = FocusNode();
  bool _isFocus = false;
  bool _isError = false;
  bool _isOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusedNode.addListener(() {
      if (_focusedNode.hasFocus) {
        setState(() {
          _isError = false;
          _isFocus = _focusedNode.hasFocus;
        });
      } else {
        if (widget.controller.text.isEmpty) {
          setState(() {
            _isError = true;
          });
        }
        setState(() {
          _isFocus = _focusedNode.hasFocus;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      children: [
        if (widget.title != null)
          Container(
            width: orientation == Orientation.portrait ? 335.w : 335,
            margin: EdgeInsets.only(
              bottom: orientation == Orientation.portrait ? 8.h : 8,
            ),
            child: Text(
              widget.title!,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: orientation == Orientation.portrait ? 14.sp : 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(147, 147, 150, 1),
              ),
            ),
          ),
        Container(
          width: orientation == Orientation.portrait ? 335.w : 335,
          height: orientation == Orientation.portrait ? 48.h : 48,
          decoration: BoxDecoration(
            color: Color.fromRGBO(245, 245, 249, 1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: _isFocus
                  ? Color.fromRGBO(34, 84, 245, 0.5)
                  : Color.fromRGBO(235, 235, 235, 1),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: orientation == Orientation.portrait ? 14.w : 14,
                  vertical: 0,
                ),
                child: Expanded(
                  child: TextSelectionTheme(
                    data: TextSelectionThemeData(
                      cursorColor: Color.fromRGBO(26, 111, 238, 1),
                      selectionHandleColor: Color.fromRGBO(26, 111, 238, 1),
                      selectionColor: Color.fromRGBO(34, 84, 245, 0.5),
                    ),
                    child: TextField(
                      obscureText: widget.isPassword
                          ? _isOpen
                                ? false
                                : true
                          : false,
                      obscuringCharacter: '*',
                      controller: widget.controller,
                      focusNode: _focusedNode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: orientation == Orientation.portrait
                              ? 15.sp
                              : 15,
                          height: 20 / 15,
                          letterSpacing: 0,
                          color: Color.fromRGBO(147, 147, 150, 1),
                        ),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: orientation == Orientation.portrait
                            ? 15.sp
                            : 15,
                        height: 20 / 15,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.isPassword)
                Padding(
                  padding: EdgeInsets.only(
                    right: orientation == Orientation.portrait ? 15.w : 15,
                    top: 0,
                    bottom: 0,
                  ),
                  child: Center(
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        _isOpen ? 'icons/eye-open.svg' : 'icons/eye-close.svg',
                        package: 'time_ui_kit',
                        height: orientation == Orientation.portrait ? 20.h : 20,
                        width: orientation == Orientation.portrait ? 20.w : 20,
                        color: Colors.black,
                      ),
                      onTap: () {
                        setState(() {
                          _isOpen = !_isOpen;
                        });
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_isError)
          Container(
            width: orientation == Orientation.portrait ? 335.w : 335,
            margin: EdgeInsets.only(
              top: orientation == Orientation.portrait ? 8.h : 8,
            ),
            child: Text(
              widget.errorText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: orientation == Orientation.portrait ? 14.sp : 14,
                height: 20 / 14,
                letterSpacing: 0,
                color: Color.fromRGBO(253, 53, 53, 1),
              ),
            ),
          ),
      ],
    );
  }
}
