import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/tabs/favourite_tab.dart';
import 'package:todo_app/screens/home/tabs/home_tab/home_tab.dart';
import 'package:todo_app/screens/home/tabs/map_tab/map_tab.dart';
import 'package:todo_app/screens/home/tabs/person_tab.dart';

import '../create_event.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routeName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEvent.routeName);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "home".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            label: "map".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
            label: "favorite".tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "profile".tr(),
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [HomeTab(), MapTab(), FavouriteTab(), PersonTab()];
}
