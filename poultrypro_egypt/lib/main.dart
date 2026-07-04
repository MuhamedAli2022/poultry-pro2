import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const PoultryProApp());
}

class PoultryProApp extends StatefulWidget {
  const PoultryProApp({Key? key}) : super(key: key);

  @override
  State<PoultryProApp> createState() => _PoultryProAppState();
}

class _PoultryProAppState extends State<PoultryProApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PoultryPro Egypt',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: HomeScreen(onThemeToggle: toggleTheme),
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
    );
  }
}
