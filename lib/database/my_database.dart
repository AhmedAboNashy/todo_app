import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/task.dart';

class MyDatabase {
  //CollectionReference--> da ely by4eel el collection
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

  static Future<void> insertTask(Task task) {
    // hageeb eldatabase 3n taree2 -->FirebaseFirestore.instance
    // R--> ya3ny dynamic  ay noo3
    var tasksCollection = getTasksCollection();
    var taskDoc = tasksCollection.doc(); // create new doc BEL ID BETA3O
    task.id = taskDoc.id;
    return taskDoc.set(task).then((value) {
      // called when future  is completed
      // show message

      // fe el ubdate hnest5dm set bardo
    });
  }

  static Future< QuerySnapshot<Task>> getAllTasks() async {
    // read data once

    {
    return await getTasksCollection().get();


    }
  }

static Stream<QuerySnapshot<Task>> listenForTasksRealTimeUbdates(){
    //listen for real time ubdates
    return  getTasksCollection().snapshots();
}



  static Future<void> deleteTask(Task task) {
    var taskDoc = getTasksCollection().doc(task.id);
    return taskDoc.delete();
  }
}
// Future --> bnst5dm m3aha await
