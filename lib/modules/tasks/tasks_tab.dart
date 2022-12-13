import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task/task.dart';
import 'package:todo_app/modules/tasks/task_item.dart';
import 'package:todo_app/shared/components/my_spacer.dart';
import 'package:todo_app/shared/network/local/firebase_utils.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  var dateSelected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: dateSelected,
          firstDate: DateTime.now().subtract(
            const Duration(
              days: 365,
            ),
          ),
          lastDate: DateTime.now().add(
            const Duration(
              days: 365,
            ),
          ),
          onDateSelected: (date) {
            dateSelected = date;
            setState(() {});
            // print(dateSelected);
          },
          leftMargin: 15,
          monthColor: provider.isDark() ? whiteColor : darkColor,
          dayColor: provider.isDark() ? whiteColor : darkColor,
          activeDayColor: provider.isDark() ? darkColor : whiteColor,
          activeBackgroundDayColor: blueColor,
          dotsColor: Colors.transparent,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        const MySpacer(
          height: 20,
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Task>>(
            stream: getFromFireStore(dateSelected),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(AppLocalizations.of(context)!.somethingwentwrong);
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.loading,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }
              var tasks = snapshot.data!.docs.map((e) => e.data()).toList();
              if (tasks.isEmpty) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.nothavetasktoday,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.transparent,
                ),
                itemBuilder: (context, index) => TaskItem(task: tasks[index]),
                itemCount: tasks.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
