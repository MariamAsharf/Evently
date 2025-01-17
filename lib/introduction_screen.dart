import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/onboarding_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionnScreen extends StatelessWidget {
  const IntroductionnScreen({super.key});

  static const String routeName = "Introductionn Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
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
              "Personalize Your Experience",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: MYtheme.secondryColor),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: MYtheme.thirdColor),
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: MYtheme.secondryColor),
                ),
                ToggleSwitch(
                  minWidth: 50.28,
                  initialLabelIndex: 0,
                  cornerRadius: 30,
                  activeBgColor: [MYtheme.secondryColor],
                  activeFgColor: MYtheme.primaryColor,
                  inactiveBgColor: MYtheme.primaryColor,
                  inactiveFgColor: MYtheme.secondryColor,
                  totalSwitches: 2,
                  icons: [
                    IconData(
                      Flags.egypt as int,
                    ),
                    IconData(
                      Flags.united_states_of_america as int,
                    ),
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Theme",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: MYtheme.secondryColor),
                ),
                ToggleSwitch(
                  minWidth: 50.28,
                  initialLabelIndex: 0,
                  cornerRadius: 30,
                  activeBgColor: [MYtheme.secondryColor],
                  activeFgColor: MYtheme.primaryColor,
                  inactiveBgColor: MYtheme.primaryColor,
                  inactiveFgColor: MYtheme.secondryColor,
                  totalSwitches: 2,
                  icons: [Icons.sunny, Icons.dark_mode],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(MYtheme.secondryColor),
                fixedSize: WidgetStatePropertyAll(
                  Size(361, 56),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, OnboardingScreen.routeName);
              },
              child: Text(
                "Let's Start",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MYtheme.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
