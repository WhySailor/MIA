import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

Map<int, Color> customPrimaryMap = {
  50: const Color(0xffffecda),
  100: const Color(0xffffcea5),
  200: const Color(0xfffbad6e),
  300: const Color(0xfff58c3b),
  400: const Color(0xfff17415),
  500: const Color(0xffeb5c00),
  600: const Color(0xffe65000),
  700: const Color(0xffe03d08),
  800: const Color(0xffd8250d),
  900: const Color(0xffcc0011),
};

Map<int, Color> customComplementaryMap = {
  50: const Color(0xffe8f5fe),
  100: const Color(0xffc6e5ff),
  200: const Color(0xffa5d6ff),
  300: const Color(0xff83c6ff),
  400: const Color(0xff6ab9ff),
  500: const Color(0xff58adff),
  600: const Color(0xff529ef4),
  700: const Color(0xff4a8be0),
  800: const Color(0xff447acf),
  900: const Color(0xff385bb0),
};

MaterialColor customPrimaryColor = MaterialColor(0xFFffcea5, customPrimaryMap);
MaterialColor customComplementaryColor =
    MaterialColor(0xFFa5d6ff, customComplementaryMap);

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: const Color(0xffFFCEA5),
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
    ),
    AppTheme.lightTheme: ThemeData(
      primarySwatch: customPrimaryColor,
      primaryColor: const Color(0xffFFCEA5),
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFFDECDE),
      dividerColor: const Color(0xffFFCEA5),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xffD08F57),
        foregroundColor: Color(0xFF282828),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(const Color(0xFF282828)),
        ),
      ),
      fontFamily: "K2D",
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xffFFCEA5),
          selectedItemColor: Color(0xFF282828),
          unselectedItemColor: Color(0xffD08F57)),
    ),
  };
}
