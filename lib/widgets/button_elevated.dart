import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonElevated extends StatefulWidget {
  final String text;
  final Icon icons;

  const ButtonElevated({Key? key, required this.text, required this.icons})
      : super(key: key);

  @override
  _ButtonElevatedState createState() => _ButtonElevatedState();
}

class _ButtonElevatedState extends State<ButtonElevated> {
  bool boxWidth = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: () {},
        onHover: (val) {
          setState(() {
            boxWidth = val;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: Get.textTheme.subtitle1!.copyWith(
                color: Get.theme.primaryColor,
              ),
            ),
            AnimatedContainer(
              width: boxWidth ? 5 : 15,
              curve: Curves.easeInCubic,
              duration: Duration(milliseconds: 300),
            ),
            widget.icons,
          ],
        ),
      ),
    );
    ;
  }
}
