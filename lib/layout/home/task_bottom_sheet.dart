import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task/task.dart';
import 'package:todo_app/shared/components/my_spacer.dart';
import 'package:todo_app/shared/components/my_text_form_field.dart';
import 'package:todo_app/shared/network/local/firebase_utils.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var formKey = GlobalKey<FormState>();

  var title = TextEditingController();

  var description = TextEditingController();

  var dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<ThemeProvider>().isDark() ? bottomColor : whiteColor,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          top: 20,
          bottom: 20,
        ),
        margin: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add new Task',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const MySpacer(),
              MyTextFormField(
                hintText: 'Enter task title',
                controller: title,
                inValid: 'Please enter your task title',
              ),
              const MySpacer(),
              MyTextFormField(
                hintText: 'Enter task description',
                controller: description,
                maxLines: 4,
                inValid: 'Please enter your task description',
              ),
              const MySpacer(),
              Text(
                'Selected Date',
                style: Theme.of(context).textTheme.headline6,
              ),
              const MySpacer(),
              InkWell(
                onTap: () {
                  changeDateTime(context);
                },
                child: Text(
                  DateFormat.yMd().format(dateTime),
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              const MySpacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  elevation: 0,
                  fixedSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(
                      10,
                    ),
                  ),
                ),
                onPressed: () {
                  Task task = Task(
                      title: title.text,
                      date: dateTime.millisecondsSinceEpoch,
                      description: description.text);
                  if (formKey.currentState!.validate()) {
                    addTask(task);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  'Add',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeDateTime(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(
          days: 365,
        ),
      ),
    ).then((value) {
      if (value == null) return;
      dateTime = value;
      setState(() {});
    });
  }

  void addTask(Task task) {
    addToFireStore(task).timeout(
      const Duration(
        milliseconds: 500,
      ),
      onTimeout: () {
        print(task.id);
        print(task.title);
        print(task.description);
        print(task.isDone);
        print(task.date);
        print('Task added');
      },
    );
  }
}
