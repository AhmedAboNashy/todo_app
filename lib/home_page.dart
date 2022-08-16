import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
 static String routeName='home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App',textAlign: TextAlign.center,),
      ),
      bottomNavigationBar: BottomAppBar(
        shape:  CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [

            BottomNavigationBarItem(icon:Icon(Icons.list),label: ''),
            BottomNavigationBarItem(icon:Icon(Icons.settings),label: ''),

          ],

        ),
      ),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

floatingActionButton: FloatingActionButton(
    shape: StadiumBorder(
      side: BorderSide(
        color:  Colors.white,width: 4
      )
    ),
  onPressed: (){},child: Icon(Icons.add),),
    );
  }
}
