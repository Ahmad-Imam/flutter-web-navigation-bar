import 'dart:ui';

import 'package:flutter/material.dart';

class CustomClippers extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double heightDelta = size.height / 2.2;

    Path path0 = Path();
    path0.moveTo(size.width*0.3974333,size.height*0.3859286);
    path0.cubicTo(size.width*0.4783417,size.height*0.2636857,size.width*0.5211000,size.height*0.3034000,size.width*0.5699000,size.height*0.4011429);
    path0.quadraticBezierTo(size.width*0.5710583,size.height*0.6192571,size.width*0.4810500,size.height*0.6127857);
    path0.quadraticBezierTo(size.width*0.3890833,size.height*0.6071714,size.width*0.3974333,size.height*0.3859286);
    path0.close();



    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}