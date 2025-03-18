import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/provider/user_provider.dart';
import 'package:todo_app/screens/login_screen.dart';

class PersonTab extends StatefulWidget {
  PersonTab({super.key});

  @override
  State<PersonTab> createState() => _PersonTabState();
}

class _PersonTabState extends State<PersonTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(64),
                ),
                color: Theme.of(context).primaryColor),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/route.png",
                  width: 124,
                  height: 124,
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userProvider.userModel?.name}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${userProvider.userModel?.email}",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24),
                  Text("Language",
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        index = index == 1 ? 0 : 1;
                      });
                      if (index == 1) {
                        context.setLocale(
                          Locale('ar'),
                        );
                      } else {
                        context.setLocale(
                          Locale('en'),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Theme.of(context).scaffoldBackgroundColor),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.locale.toString() == 'en'
                              ? "English"
                              : "Arabic",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Theme", style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      provider.changeTheme();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Theme.of(context).scaffoldBackgroundColor),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.themeMode == ThemeMode.light
                              ? "Light"
                              : "Dark",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFFFF5659),
                      ),
                    ),
                    onPressed: () {
                      FirebaseManager.logOut().then((_) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.routeName, (route) => false);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.logout, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Logout",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
