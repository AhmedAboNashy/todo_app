import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/tasks_list/task_widget.dart';

class TasksListTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          showYears: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            // on user choose new date
          },
          leftMargin: 20,
          dayColor: Colors.black,
          activeDayColor: Theme.of(context).primaryColor,
          activeBackgroundDayColor: Colors.white,
          monthColor: Colors.black,
          dotsColor: Theme.of(context).primaryColor,
          selectableDayPredicate: (date) => date.day != 21,
          locale: 'en_ISO',
        ),
        Expanded(
          child:StreamBuilder<QuerySnapshot<Task>>(
            //  future: MyDatabase.getAllTasks(),
            stream: MyDatabase.listenForTasksRealTimeUbdates(),
              builder: (buildContext, snapshot) {
                if (snapshot.hasError) {
                  //todo :add Try again button

                  return Column(
                    children: [
                      Text('Error Loading Data, Please try again later'),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                  //is loading || no}
                }
                //snapshot finish has data
                var data = snapshot.data?.docs.map((e) =>e.data()).toList();
                return ListView.builder(
                  itemBuilder: (buildContext, index) {
                    return TaskWidget(data![index]);
                  },
                  itemCount: data!.length,
                );
              }),
        ),
      ],
    );
  }
}
