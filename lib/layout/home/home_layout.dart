import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/provider/bottom_nav_bar_provider.dart';
import 'package:todo_app/modules/settings/settings_tab.dart';
import 'package:todo_app/modules/tasks/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String routeName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, provider, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.todolist,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.showTaskBottomSheet(context);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8.0,
          child: BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.changeTabs(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.list_outlined,
                ),
                label: AppLocalizations.of(context)!.tasks,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                ),
                label: AppLocalizations.of(context)!.settings,
              ),
            ],
          ),
        ),
        body: [TasksTab(), SettingsTab()][provider.currentIndex],
      ),
    );
  }
}
