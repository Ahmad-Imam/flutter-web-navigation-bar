import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData k_darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    backgroundColor: Colors.amber,
    scaffoldBackgroundColor: Color(0xff191627),
    highlightColor: Colors.grey,
    splashColor: Colors.transparent,
    primaryColor: Colors.red,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
      overlayColor: MaterialStateProperty.all(Colors.deepPurple),
    )),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white70),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
        hoverColor: Colors.deepPurpleAccent));

ThemeData k_lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    backgroundColor: Colors.deepPurple,
    primaryColor: Colors.amber,
    highlightColor: Colors.black,
    splashColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
    )),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black54),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));
