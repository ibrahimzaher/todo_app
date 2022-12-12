import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/tasks/tassk_item.dart';
import 'package:todo_app/shared/components/my_spacer.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TasksTab extends StatelessWidget {
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
            print(dateSelected);
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
          child: ListView.builder(
            itemBuilder: (context, index) => const TaskItem(),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
