import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task/task.dart';
import 'package:todo_app/modules/tasks/task_edit_screen.dart';
import 'package:todo_app/shared/network/local/firebase_utils.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Slidable(
      key: ValueKey(task.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .25,
        children: [
          const SizedBox(
            width: 15,
          ),
          SlidableAction(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            onPressed: (context) => deleteTask(task),
            backgroundColor: redColor,
            foregroundColor: whiteColor,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
      child: InkWell(
        onTap: task.isDone
            ? null
            : () {
                Navigator.of(context)
                    .pushNamed(TaskEditScreen.routeName, arguments: task);
              },
        child: Container(
          margin: const EdgeInsetsDirectional.only(
            end: 20,
            start: 20,
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
                color: task.isDone ? greenColor : blueColor,
                width: 4,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        task.title,
                        style: task.isDone
                            ? Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: greenColor)
                            : Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                        top: 4,
                      ),
                      child: Text(
                        task.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              task.isDone
                  ? Text(
                      AppLocalizations.of(context)!.done,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: greenColor),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(
                            15,
                          ),
                        ),
                      ),
                      onPressed: () {
                        updateIsDone(task);
                      },
                      child: Icon(
                        Icons.check_sharp,
                        color: whiteColor,
                        size: 30,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
