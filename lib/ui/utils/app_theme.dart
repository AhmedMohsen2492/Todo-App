import 'package:flutter/material.dart';
import 'package:todo_route/ui/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.primary,
      titleTextStyle: AppTheme.appBarTextStyle,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 32),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightGrey,
    ),
  );

  static ThemeData darkTheme = ThemeData();

  static const TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColors.white,
  );

  static const TextStyle taskTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle taskDescriptionTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppColors.lightBlack,
  );

  static const TextStyle bottomSheetTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
}