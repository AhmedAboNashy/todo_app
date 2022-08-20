import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/dialogeUtils.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add New Task',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextFormField(
                controller: titleController,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'please Enter Title';
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text('title')),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: descController,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please EnterDescription';
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.titleSmall,
                minLines: 4,
                maxLines: 4,
                decoration: InputDecoration(label: Text('Description')),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Select Date',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () {
                  showDateDialoge();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${selectedDate.year}/ ${selectedDate.month}/${selectedDate.day}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    //3l4an at2ked en elform feha haga
                    addTask();
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  void showDateDialoge() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (date != null) {
      setState(() {
        selectedDate == date;
      });
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      String title = titleController.text;
      String desc = descController.text;
      Task task = Task(
        title: title,
        description: desc,
        dateTime: selectedDate,
        isDone: false);
          showLoading(context, 'Loading...',isCancelable: false);

      MyDatabase.insertTask(task).then((
          value) {
        hideLoading(context);
        // called when future  is completed
        // show message
        showMessage(context, 'Task added Succssfully',
            posActionName: 'ok',posAction: (){
          // 3mlna Navigator.pop 4l4an el pottom sheet tenzel
          Navigator.pop(context);
            }
        );
      }).onError((error, stackTrace) {
        showMessage(context, 'something went wrong, try again later');
        // called when task future fails
      }).timeout(Duration(seconds: 5), onTimeout: () {
        hideLoading(context);
        //save changes in memory --> lw el net fasel
        showMessage(context, 'Task Saved Locally');
      });
    }
  }
}
