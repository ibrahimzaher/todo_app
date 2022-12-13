import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/components/my_spacer.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';

class ModeBottomSheet extends StatelessWidget {
  const ModeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          provider.isDark()
              ? selectedWidget('Dark', context)
              : selectedWidget('Light', context),
          const MySpacer(
            height: 20,
          ),
          provider.isDark()
              ? unSelectedWidget('Light', context)
              : unSelectedWidget('Dark', context),
        ],
      ),
    );
  }
}

Widget selectedWidget(String mode, context) {
  var provider = Provider.of<ThemeProvider>(context);
  return InkWell(
    onTap: () {
      provider.toggleTheme(mode == 'Light' ? ThemeMode.light : ThemeMode.dark);
    },
    child: Container(
      padding: const EdgeInsetsDirectional.all(
        15,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mode,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 18,
                ),
          ),
          Icon(
            Icons.check,
            size: 30,
            color: blueColor,
          ),
        ],
      ),
    ),
  );
}

Widget unSelectedWidget(String mode, context) {
  var provider = Provider.of<ThemeProvider>(context);

  return InkWell(
    onTap: () {
      provider.toggleTheme(mode == 'Light' ? ThemeMode.light : ThemeMode.dark);
    },
    child: Container(
      padding: const EdgeInsetsDirectional.all(
        25,
      ),
      width: double.infinity,
      color: Colors.white,
      child: Text(
        mode,
        style: Theme.of(context).textTheme.headline2!.copyWith(
              color: darkColor,
            ),
      ),
    ),
  );
}
