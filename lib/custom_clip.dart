import 'dart:ui';

import 'package:flutter/material.dart';

class CustomClippersPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double heightDelta = size.height / 2.2;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5008333, size.height * 0.9957143);
    path0.quadraticBezierTo(size.width * 0.0414833, size.height * 0.7855714,
        size.width * 0.0408333, size.height * 0.5714286);
    path0.quadraticBezierTo(size.width * 0.0417083, size.height * 0.0742571,
        size.width * 0.5000000, size.height * 0.0685714);
    path0.quadraticBezierTo(size.width * 0.9587500, size.height * 0.0743429,
        size.width * 0.9583333, size.height * 0.5728571);
    path0.quadraticBezierTo(size.width * 0.9589583, size.height * 0.7857143,
        size.width * 0.5008333, size.height * 0.9957143);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
