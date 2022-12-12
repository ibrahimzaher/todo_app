import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task/task.dart';
import 'package:todo_app/shared/components/my_spacer.dart';
import 'package:todo_app/shared/components/my_text_form_field.dart';
import 'package:todo_app/shared/network/local/firebase_utils.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({Key? key}) : super(key: key);
  static const String routeName = 'Edit';

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  DateTime dateTime = DateTime.now();
  late GlobalKey<FormState> formKey;
  late TextEditingController title;
  late TextEditingController description;
  late String id;
  late bool isDone;
  @override
  void didChangeDependencies() {
    formKey = GlobalKey<FormState>();
    Task args = ModalRoute.of(context)!.settings.arguments as Task;
    dateTime = DateTime.fromMillisecondsSinceEpoch(args.date);
    title = TextEditingController(text: args.title);
    description = TextEditingController(text: args.description);
    id = args.id;
    isDone = args.isDone;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'To Do List',
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 40,
          bottom: 80,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.all(
              Radius.circular(20),
            ),
            color: context.watch<ThemeProvider>().isDark()
                ? bottomColor
                : whiteColor,
          ),
          padding: const EdgeInsetsDirectional.only(
            top: 20,
            bottom: 20,
            start: 20,
            end: 20,
          ),
          margin: const EdgeInsetsDirectional.only(
            start: 20,
            end: 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Edit Task',
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
                      description: description.text,
                      isDone: isDone,
                      id: id,
                    );
                    if (formKey.currentState!.validate()) {
                      updateTask(task);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Save Changes',
                  ),
                ),
              ],
            ),
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
}
