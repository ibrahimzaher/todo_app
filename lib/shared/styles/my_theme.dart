import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/shared/styles/colors.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    primaryColor: blueColor,
    scaffoldBackgroundColor: scaffoldColorLight,
    textTheme: TextTheme(
      headline5: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      bodyText1: TextStyle(
        color: hintLightColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blueColor,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: CircleBorder(
        side: BorderSide(
          color: whiteColor,
          width: 4,
        ),
      ),
      backgroundColor: blueColor,
      iconSize: 30,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: const CircularNotchedRectangle(),
      color: whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: blueColor,
      unselectedItemColor: greyColor,
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 25,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: blueColor,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: blueColor,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    primaryColor: blueColor,
    scaffoldBackgroundColor: scaffoldColorDark,
    textTheme: TextTheme(
      headline5: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: darkColor,
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodyText1: TextStyle(
        color: hintDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blueColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: blueColor,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: blueColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: darkColor,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: CircleBorder(
        side: BorderSide(
          color: whiteColor,
          width: 4,
        ),
      ),
      backgroundColor: blueColor,
      iconSize: 30,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: const CircularNotchedRectangle(),
      color: bottomColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: blueColor,
      unselectedItemColor: greyColor,
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 25,
      ),
    ),
  );
}
