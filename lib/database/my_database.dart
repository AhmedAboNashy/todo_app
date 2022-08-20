import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/task.dart';

class MyDatabase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance.collection(Task.collectionName)

        // TO FiresStore  BTRG3 map <String,dynamic> --> bs ana h2olha tt3amel m3 .withConverter && + btrg3 el opject l map

        // LMA 2OLTLO . WITHConverter<Task> ya3ny b2olo et3amely m3 el task--> ely heya noo3 el data beta3ty
        // with converter eh elfayda menha bdl mt3amel m3 map --> ht3amel m3 class
        .withConverter<Task>(fromFirestore: ((snapshot, options) {
      return Task.fromFirestors(snapshot.data()!);
    }), toFirestore: (task, options) {
      return task.toFireStore();
    });
  }

  static void insertTask(Task task) {
    // hageeb eldatabase 3n taree2 -->FirebaseFirestore.instance
    // R--> ya3ny dynamic  ay noo3
    var tasksCollection = getTasksCollection();
    var taskDoc = tasksCollection.doc(); // create new doc
    task.id = taskDoc.id;
    taskDoc.set(task);
  }
}
