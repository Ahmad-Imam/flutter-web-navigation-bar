import 'package:flutter/material.dart';
import 'package:flutter_nav/const.dart';
import 'package:flutter_nav/test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Navigation Bar',
            theme: k_lightTheme,
            darkTheme: k_darkTheme,
            home: HomePage()),
      ),
    );

    // home: MyHomePage(title: 'Flutter Demo Home Page'));
  }
}
