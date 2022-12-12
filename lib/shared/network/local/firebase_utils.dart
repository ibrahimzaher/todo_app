import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task/task.dart';

CollectionReference<Task> getCollectionReference() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}

Future<void> addToFireStore(Task task) {
  var doc = getCollectionReference().doc();
  task.id = doc.id;
  return doc.set(task);
}

Stream<QuerySnapshot<Task>> getFromFireStore(DateTime dateTime) {
  int first = DateTime(dateTime.year, dateTime.month, dateTime.day)
      .millisecondsSinceEpoch;
  int last = DateTime(dateTime.year, dateTime.month, dateTime.day + 1)
      .millisecondsSinceEpoch;
  return getCollectionReference()
      .where('date', isGreaterThanOrEqualTo: first)
      .where('date', isLessThan: last)
      .orderBy('date')
      .snapshots();
}

Future<void> updateIsDone(Task task) {
  return getCollectionReference().doc(task.id).update({'isDone': true}).timeout(
      const Duration(
        milliseconds: 500,
      ), onTimeout: () {
    // print('updated successully');
  });
}

Future<void> updateTask(Task task) {
  print(task.id);
  return getCollectionReference().doc(task.id).update(task.toJson()).timeout(
      const Duration(
        milliseconds: 500,
      ), onTimeout: () {
    // print('updated successully');
  });
}

deleteTask(Task task) {
  getCollectionReference().doc(task.id).delete().timeout(
    const Duration(
      milliseconds: 300,
    ),
    onTimeout: () {
      print('deleted task successfully');
    },
  );
}
