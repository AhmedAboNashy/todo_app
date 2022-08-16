import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mytheme {
  static const Color lightprimary = Color(0XFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0XFFDFECDB);
  // ctri D b3ml tekrar ll line wana wa2ef 3aleh
  static const Color green = Color(0XFF61E757);
  static const Color red = Color(0XFFEC4B4B);
  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: lightprimary,
      toolbarHeight: 100,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white
      )
    ),
      bottomAppBarTheme: BottomAppBarTheme(
        shape:  CircularNotchedRectangle(),
      ),
      primaryColor: lightprimary,
      scaffoldBackgroundColor: lightScaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 28)
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(color:lightprimary,fontWeight: FontWeight.bold,fontSize:24
        ),
        bodySmall: TextStyle(color:Colors.black,fontSize:12
        ),
      ),


  );
}
