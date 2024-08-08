import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/ui/providers/list_provider.dart';
import 'package:todo_route/ui/screens/edit/edit_screen.dart';
import 'package:todo_route/ui/screens/home/home_screen.dart';
import 'package:todo_route/ui/screens/splash/splash_screen.dart';
import 'package:todo_route/ui/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (_) {
        return ListProvider();
      },
      child: const MyApp()));
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
        HomeScreen.routeName: (_) => const HomeScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        EditScreen.routeName: (_) => const EditScreen()
      },
    );
  }
}
