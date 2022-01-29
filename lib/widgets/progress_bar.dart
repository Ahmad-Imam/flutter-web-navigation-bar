import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';

class ProgressbarAnimation extends StatelessWidget {
  final text;
  final number;
  const ProgressbarAnimation({
    Key? key,
    this.text,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: Duration(milliseconds: 2000),
        curve: Curves.easeOut,
        tween: Tween<double>(begin: 0, end: number),
        builder: (context, double gg, _) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${text}'),
                  Text('${(gg * 100).toPrecision(0)}%'),
                ],
              ),
              
              LinearProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.amber,
                ),
                value: gg,
              ),
            ],
          );
        });
        
 
  }
}
