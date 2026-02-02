import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Select extends StatefulWidget {
  const Select({
    super.key,
    required this.items,
    required this.title,
    required this.changeValue,
  });

  final List<String> items;
  final String title;
  final ValueChanged<String> changeValue;

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  late String _title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      child: Container(
        width: orientation == Orientation.portrait ? 335.w : 335,
        height: orientation == Orientation.portrait ? 48.h : 48,
        decoration: BoxDecoration(
          color: Color.fromRGBO(245, 245, 249, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(235, 235, 235, 1), width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: orientation == Orientation.portrait ? 14.w : 14,
            vertical: 0,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: orientation == Orientation.portrait ? 16.sp : 16,
                    height: 20 / 16,
                    letterSpacing: -0.32,
                    color: widget.title != _title
                        ? Colors.black
                        : Color.fromRGBO(147, 147, 150, 1),
                  ),
                ),
                SvgPicture.asset(
                  'icons/chevron-down.svg',
                  package: 'time_ui_kit',
                  height: orientation == Orientation.portrait ? 20.h : 20,
                  width: orientation == Orientation.portrait ? 20.w : 20,
                  color: Color.fromRGBO(126, 126, 154, 1),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 10, left: 10),
              itemCount: widget.items.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  child: Text(widget.items[i], style: TextStyle(fontSize: 18),),
                  onTap: () {
                    setState(() {
                      _title = widget.items[i];
                      widget.changeValue(widget.items[i]);
                    });
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
