import 'package:flutter/material.dart';
import 'package:todo_route/ui/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.accent,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.primary,
      titleTextStyle: AppTheme.appBarTextStyle,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.primary,
      thickness: 4,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 32),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightGrey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(
          side: BorderSide(
              color: AppColors.white,
              width: 4
          )
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData();

  static const TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColors.white,
  );

  static const TextStyle settingsTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.black,
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

  static const TextStyle bottomSheetDateTitleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.lightBlack,
  );
}