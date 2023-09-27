import 'package:flutter/material.dart';
import 'package:todo_route/ui/screens/home/home_screen.dart';
import 'package:todo_route/ui/screens/splash/splash_screen.dart';
import 'package:todo_route/ui/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SplashScreen.routeName : (_) => SplashScreen(),
      },
    );
  }
}
