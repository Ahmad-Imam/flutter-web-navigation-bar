import 'package:flutter/material.dart';
import 'package:flutter_nav/const.dart';
import 'package:get/get.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Bar',
      theme: k_lightTheme,
      darkTheme: k_darkTheme,
      home: HomePage()
    );
  }
}

