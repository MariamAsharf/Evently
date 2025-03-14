import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme/theme.dart';
import 'package:todo_app/onboarding_screen.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/provider/user_provider.dart';
import 'package:todo_app/screens/create_event.dart';
import 'package:todo_app/screens/forget_password_screen.dart';
import 'package:todo_app/screens/introduction_screen.dart';
import 'package:todo_app/screens/register_screen.dart';

import 'firebase_options.dart';
import 'my_theme/dark_theme.dart';
import 'my_theme/light_theme.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

    return true;
  };
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
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
    var authProvider = Provider.of<UserProvider>(context);

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
        initialRoute: authProvider.currentUser != null
            ? HomeScreen.routeName
            : IntroductionnScreen.routeName,
        routes: {
          IntroductionnScreen.routeName: (context) => IntroductionnScreen(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          CreateEvent.routeName: (context) => CreateEvent(),
        });
  }
}
