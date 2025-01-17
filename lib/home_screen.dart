import 'package:flutter/material.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "Home Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MYtheme.secondryColor,
        title: Column(
          children: [
            Text(
              "Welcome Back ✨",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: MYtheme.primaryColor),
            ),
            Text(
              "John Safwat",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: MYtheme.primaryColor),
            ),
          ],
        ),
        actions: [
          ToggleSwitch(
            minWidth: 69,
            initialLabelIndex: 0,
            cornerRadius: 8,
            activeBgColor: [MYtheme.secondryColor],
            activeFgColor: MYtheme.primaryColor,
            inactiveBgColor: MYtheme.primaryColor,
            inactiveFgColor: MYtheme.secondryColor,
            totalSwitches: 2,
            icons: [Icons.sunny],
            labels: ["En"],
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
        ],
      ),
    );
  }
}
