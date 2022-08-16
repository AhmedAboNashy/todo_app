import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

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
          dotsColor:Theme.of(context).primaryColor,
          selectableDayPredicate: (date) => date.day != 21,
          locale: 'en_ISO',
        )
      ],
    );
  }
}
