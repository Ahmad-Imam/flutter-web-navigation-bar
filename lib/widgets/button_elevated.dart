import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ButtonElevated extends StatefulWidget {
  final String text;
  final Icon icons;
  final Function ontap;

  const ButtonElevated(
      {Key? key, required this.text, required this.icons, required this.ontap})
      : super(key: key);

  @override
  _ButtonElevatedState createState() => _ButtonElevatedState();
}

class _ButtonElevatedState extends State<ButtonElevated> {
  bool boxWidth = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50.h,
      alignment: Alignment.center,
      child: ElevatedButton(
        style: context.theme.elevatedButtonTheme.style!.copyWith(),
        onPressed: () => widget.ontap(),
        onHover: (val) {
          setState(() {
            boxWidth = val;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 20,
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),
            ),
            AnimatedContainer(
              width: boxWidth ? 0 : 10,
              curve: Curves.decelerate,
              duration: Duration(milliseconds: 300),
            ),
            Expanded(child: widget.icons),
          ],
        ),
      ),
    );
    ;
  }
}
