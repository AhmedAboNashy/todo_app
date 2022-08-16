import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mytheme {
  static const Color lightprimary = Color(0XFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0XFFDFECDB);
  // ctri D b3ml tekrar ll line wana wa2ef 3aleh
  static const Color green = Color(0XFF61E757);
  static const Color red = Color(0XFFEC4B4B);
  static final lightTheme = ThemeData(
      primaryColor: lightprimary,
      scaffoldBackgroundColor: lightScaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 36)));
}
