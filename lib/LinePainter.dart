import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9515600,size.height*0.1951225);
    path_0.cubicTo(size.width*1.032910,size.height*0.3321856,size.width*1.006545,size.height*0.5498717,size.width*0.9116400,size.height*0.7175722);
    path_0.cubicTo(size.width*0.8167300,size.height*0.8852781,size.width*0.6540350,size.height*1.002989,size.width*0.5011300,size.height*0.9965401);
    path_0.cubicTo(size.width*0.3482270,size.height*0.9908930,size.width*0.2051140,size.height*0.8610856,size.width*0.1087015,size.height*0.6917754);
    path_0.cubicTo(size.width*0.01228875,size.height*0.5232679,size.width*-0.03742405,size.height*0.3160604,size.width*0.03337905,size.height*0.1846412);
    path_0.cubicTo(size.width*0.1049355,size.height*0.05402781,size.width*0.2985140,size.height*-0.0007974973,size.width*0.4898330,size.height*0.000008755989);
    path_0.cubicTo(size.width*0.6811500,size.height*0.001621262,size.width*0.8709650,size.height*0.05805882,size.width*0.9515600,size.height*0.1951225);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.9515600,size.height*0.1951225);
    path_1.cubicTo(size.width*1.032910,size.height*0.3321856,size.width*1.006545,size.height*0.5498717,size.width*0.9116400,size.height*0.7175722);
    path_1.cubicTo(size.width*0.8167300,size.height*0.8852781,size.width*0.6540350,size.height*1.002989,size.width*0.5011300,size.height*0.9965401);
    path_1.cubicTo(size.width*0.3482270,size.height*0.9908930,size.width*0.2051140,size.height*0.8610856,size.width*0.1087015,size.height*0.6917754);
    path_1.cubicTo(size.width*0.01228875,size.height*0.5232679,size.width*-0.03742405,size.height*0.3160604,size.width*0.03337905,size.height*0.1846412);
    path_1.cubicTo(size.width*0.1049355,size.height*0.05402781,size.width*0.2985140,size.height*-0.0007974973,size.width*0.4898330,size.height*0.000008755989);
    path_1.cubicTo(size.width*0.6811500,size.height*0.001621262,size.width*0.8709650,size.height*0.05805882,size.width*0.9515600,size.height*0.1951225);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff000000).withOpacity(1);
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.09;


    Path path0 = Path();
    path0.moveTo(size.width*0.4575000,size.height*0.4285714);
    path0.cubicTo(size.width*0.4978833,size.height*0.3605571,size.width*0.5478167,size.height*0.3614000,size.width*0.5833333,size.height*0.4285714);
    path0.quadraticBezierTo(size.width*0.5838833,size.height*0.5375857,size.width*0.5225000,size.height*0.5714286);
    path0.quadraticBezierTo(size.width*0.4582667,size.height*0.5336571,size.width*0.4575000,size.height*0.4285714);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
