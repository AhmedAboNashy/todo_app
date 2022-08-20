import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/dialogeUtils.dart';
import 'package:todo_app/my_Theme_data.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          Container(
            child: SlidableAction(
              onPressed: (
                _,
              ) {
                MyDatabase.deleteTask(task)
                    .then((value) {
                      showMessage(context, 'Tas kDeleted Successfully',posActionName: 'ok');
                })
                    .onError((error, stackTrace) {})
                    .timeout(Duration(seconds: 5), onTimeout: () {
                  showMessage(context, 'Something Went Wrong,' 'please Try again later',
                      posActionName: 'ok');
                });
              },
              icon: Icons.delete,
              backgroundColor: mytheme.red,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            ),
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    width: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                      ),
                      Text(
                        task.description ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColor),
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
