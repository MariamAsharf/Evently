import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/introduction_screen.dart';
import 'package:todo_app/my_theme/theme.dart';
import 'package:todo_app/onboarding_screen.dart';
import 'package:todo_app/provider/my_provider.dart';

import 'home_screen.dart';
import 'login_screen.dart';
import 'my_theme/dark_theme.dart';
import 'my_theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: TodoApp(),
      ),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    BaseLine lightTheme = LightTheme();
    BaseLine darkTheme = DarkTheme();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme.themeData,
        darkTheme: darkTheme.themeData,
        themeMode: provider.themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: IntroductionnScreen.routeName,
        routes: {
          IntroductionnScreen.routeName: (context) => IntroductionnScreen(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        });
  }
}
