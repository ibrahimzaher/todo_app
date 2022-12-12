import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task/task.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(
          20,
        ),
        color: provider.isDark() ? bottomColor : whiteColor,
      ),
      padding: const EdgeInsetsDirectional.all(20),
      child: Row(
        children: [
          Container(
            height: 50,
            color: blueColor,
            width: 4,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  task.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  task.description,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(
                  15,
                ),
              ),
            ),
            onPressed: () {},
            child: task.isDone
                ? Text(
                    'Done!',
                    style: Theme.of(context).textTheme.headline3,
                  )
                : Icon(
                    Icons.check_sharp,
                    color: whiteColor,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
  }
}
