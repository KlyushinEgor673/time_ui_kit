import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _focusNode = FocusNode();
  bool _isFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: orientation == Orientation.portrait ? 335.w : 335,
      height: orientation == Orientation.portrait ? 48.h : 48,
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 249, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _isFocus
              ? Color.fromRGBO(26, 111, 238, 1)
              : Color.fromRGBO(235, 235, 235, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: orientation == Orientation.portrait ? 14.w : 14,
          vertical: 0,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'icons/search.svg',
                package: 'time_ui_kit',
                height: orientation == Orientation.portrait ? 20.h : 20,
                width: orientation == Orientation.portrait ? 20.w : 20,
                color: Color.fromRGBO(126, 126, 154, 1),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: orientation == Orientation.portrait ? 14.w : 14,
                  ),
                  child: TextSelectionTheme(data: TextSelectionThemeData(
                    cursorColor: Color.fromRGBO(26, 111, 238, 1),
                    selectionHandleColor: Color.fromRGBO(26, 111, 238, 1),
                    selectionColor: Color.fromRGBO(34, 84, 245, 0.5),
                  ), child: TextField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: orientation == Orientation.portrait
                          ? 16.sp
                          : 16,
                      height: 20 / 16,
                      letterSpacing: -0.32,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Искать описание',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: orientation == Orientation.portrait
                            ? 16.sp
                            : 16,
                        height: 20 / 16,
                        letterSpacing: -0.32,
                        color: Color.fromRGBO(147, 147, 150, 1),
                      ),
                    ),
                  )),
                ),
              ),
              if (_isFocus)
                Padding(
                  padding: EdgeInsets.only(
                    right: orientation == Orientation.portrait ? 14.w : 14,
                  ),
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'icons/close.svg',
                      package: 'time_ui_kit',
                      height: orientation == Orientation.portrait ? 20.h : 20,
                      width: orientation == Orientation.portrait ? 20.w : 20,
                    ),
                    onTap: (){
                      print('CLEAR');
                      setState(() {
                        widget.controller.text = '';
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
