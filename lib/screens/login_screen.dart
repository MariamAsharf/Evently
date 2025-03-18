import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/provider/user_provider.dart';
import 'package:todo_app/screens/forget_password_screen.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/screens/register_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login Screen";

  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Logo.png", height: 170),
              SizedBox(height: 24),
              TextField(
                controller: emailController,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                decoration: InputDecoration(
                  labelText: "email".tr(),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).focusColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                decoration: InputDecoration(
                  labelText: "password".tr(),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).focusColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Theme.of(context).focusColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgetPasswordScreen.routeName);
                    },
                    child: Text(
                      "forget_password?".tr(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  FirebaseManager.login(
                    emailController.text,
                    passwordController.text,
                    () {
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    () async {
                      Navigator.pop(context);
                      await userProvider.initUser();
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.routeName, (route) => false);
                    },
                    (message) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Something Went Wrong!"),
                          content: Text(message),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Text("OK"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "login".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "don’t_have_account?".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14),
                      ),
                      TextSpan(
                        text: "create_account".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Or",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).scaffoldBackgroundColor,
                  ),
                  side: WidgetStatePropertyAll(
                    BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                onPressed: () {
                  FirebaseManager.signInWithGoogle().then((_) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => false,
                    );
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google.png"),
                    SizedBox(width: 8),
                    Text(
                      "login_with_google".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ToggleSwitch(
                minWidth: 50.28,
                initialLabelIndex: context.locale.toString() == 'en' ? 0 : 1,
                cornerRadius: 30,
                activeBgColor: [Theme.of(context).primaryColor],
                activeFgColor: Theme.of(context).scaffoldBackgroundColor,
                inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
                inactiveFgColor: Theme.of(context).primaryColor,
                totalSwitches: 2,
                icons: [
                  FontAwesomeIcons.flagUsa,
                  MdiIcons.abjadArabic,
                ],
                onToggle: (index) {
                  if (index == 1) {
                    context.setLocale(
                      Locale('ar'),
                    );
                  } else {
                    context.setLocale(
                      Locale('en'),
                    );
                  }
                  print('switched to: $index');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
