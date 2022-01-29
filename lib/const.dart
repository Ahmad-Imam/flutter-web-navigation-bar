import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData k_darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    backgroundColor: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.deepPurple,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    primaryColor: Colors.amber,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.blue),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData k_lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    backgroundColor: Colors.red,
    primaryColor: Colors.red,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.amber),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));
