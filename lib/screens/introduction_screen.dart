import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/onboarding_screen.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionnScreen extends StatelessWidget {
  const IntroductionnScreen({super.key});

  static const String routeName = "Introductionn Screen";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image(
          image: AssetImage("assets/images/Group 4.png"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage("assets/images/being-creative.png"),
              fit: BoxFit.fill,
            ),
            SizedBox(height: 16),
            Text(
              "introduction_title".tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16),
            Text("introduction_desc".tr(),
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("language".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor)),
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
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
                ToggleSwitch(
                  minWidth: 50.28,
                  initialLabelIndex:
                      provider.themeMode == ThemeMode.light ? 0 : 1,
                  cornerRadius: 30,
                  activeBgColor: [Theme.of(context).primaryColor],
                  activeFgColor: Theme.of(context).scaffoldBackgroundColor,
                  inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
                  inactiveFgColor: Theme.of(context).primaryColor,
                  totalSwitches: 2,
                  icons: [Icons.sunny, Icons.dark_mode],
                  onToggle: (index) {
                    provider.changeTheme();
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text(
                "lets_start".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
