import 'package:flutter/material.dart';
import 'package:todo_app/home/home_page.dart';
import 'package:todo_app/my_Theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
routes: {HomeScreen.routeName :(_) => HomeScreen() },
      initialRoute:  HomeScreen.routeName   ,
      theme: mytheme.lightTheme,

    );
  }
}
