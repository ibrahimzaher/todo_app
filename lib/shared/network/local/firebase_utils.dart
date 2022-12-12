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
