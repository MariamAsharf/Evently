import 'package:flutter/material.dart';
import 'package:todo_app/introduction_screen.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/onboarding_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MYtheme.lightTheme,
        darkTheme: MYtheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: IntroductionnScreen.routeName,
        routes: {
          IntroductionnScreen.routeName: (context) => IntroductionnScreen(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),

        });
  }
}
