import 'package:flutter/material.dart';
import 'package:todo_app/layout/home/task_bottom_sheet.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  changeTabs(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    notifyListeners();
  }

  showTaskBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => TaskBottomSheet(),
    );
  }
}
