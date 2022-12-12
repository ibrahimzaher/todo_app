import 'package:flutter/material.dart';
import 'package:todo_app/models/task/task.dart';

class TaskEditScreen extends StatelessWidget {
  const TaskEditScreen({Key? key}) : super(key: key);
  static const String routeName = 'Edit';
  @override
  Widget build(BuildContext context) {
    Task args = ModalRoute.of(context)!.settings.arguments as Task;
    print(args.title);
    print(args.description);
    print(args.date);
    print(args.id);
    print(args.isDone);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To Do List',
        ),
      ),
    );
  }
}
