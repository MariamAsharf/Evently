import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "Register Screen";

  RegisterScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo.png", height: 160),
            SizedBox(height: 24),
            TextField(
              controller: nameController,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).focusColor),
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                prefixIcon: Icon(
                  Icons.person,
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
              controller: emailController,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).focusColor),
              decoration: InputDecoration(
                labelText: "Email",
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
                labelText: "Password",
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
            SizedBox(height: 16),
            TextField(
              controller: rePasswordController,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).focusColor),
              decoration: InputDecoration(
                labelText: "Re Password",
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Register",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already Have Account?",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),
                    ),
                    TextSpan(
                      text: " Login",
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
    );
  }
}
