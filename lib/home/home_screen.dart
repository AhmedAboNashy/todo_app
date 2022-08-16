import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/tasks_list/tasks_list_Tap.dart';
import 'package:todo_app/settings/settings_tap.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedtindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedtindex,
          onTap: (index) {
            setState(() {
              selectedtindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: tabs[selectedtindex],
    );
  }

  var tabs = [TasksListTap(), SettingsTap()];
}
