class Task{
  static const String collectionName='tasks';
  String? id;
  String? title;
  String? description;
   DateTime?  dateTime;
   bool? isDone;

  Task({
    this.id,
    this.title,
    this.description,
    this.dateTime,
    this.isDone,
});
  Task.fromFirestors(Map<String,dynamic> data)
  :this(id: data['id'],
   title: data['title'],
    description: data['description'],
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['datetime'],),
    isDone: data['isdone']
  );
  // to FireStore ... btrg3 El data
  Map<String,dynamic> toFireStore() {
    return {
      // hn7wel eL opject l MAp
      'id': id,
      "title": title,
      "description": description,
      // 3l4an nhwelo l..long--> number ya3ny + eno by4eel Day& Year&month
      'datetime': dateTime?.millisecondsSinceEpoch,
      'isdone': isDone,
    };
  }
}
