import 'dart:ui';

import 'package:flutter/material.dart';

class CustomClippersPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double heightDelta = size.height / 2.2;

    Path path0 = Path();
 path0.moveTo(size.width*0.0008621,size.height*0.9819376);
    path0.lineTo(size.width*0.5000000,size.height*0.0032841);
    path0.lineTo(size.width*0.9896552,size.height*0.9852217);
    path0.lineTo(size.width*0.0008621,size.height*0.9819376);
    path0.close();



    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}