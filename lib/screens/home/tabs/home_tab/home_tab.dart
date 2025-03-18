import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/provider/user_provider.dart';
import 'package:todo_app/screens/home/tabs/home_tab/event_item.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categoryItems = [
    "All",
    "birthday",
    "Book Club",
    "exhibitation",
    "gaming",
    "holiday",
    "meeting",
    "sports",
    "work shop",
    "eating",
  ];

  List<IconData> IconCategory = [
    Icons.category,
    Icons.cake_outlined,
    Icons.chrome_reader_mode_outlined,
    Icons.photo_album_outlined,
    Icons.directions_bike_outlined,
    Icons.free_cancellation,
    Icons.meeting_room_outlined,
    Icons.directions_bike_outlined,
    Icons.work_outline,
    Icons.no_meals,
  ];

  int selectedCategory = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "welcome_back_✨".tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              "${userProvider.userModel?.name}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
        actions: [
          Icon(
            provider.themeMode == ThemeMode.light
                ? Icons.wb_sunny_outlined
                : Icons.dark_mode_outlined,
            size: 24,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          SizedBox(width: 4.5),
          Container(
            alignment: Alignment.center,
            width: 33,
            height: 33,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${context.locale.toString() == 'en' ? "EN" : "AR"}",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(width: 16),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(393, 100),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                      Text(
                        "cairo_egypt".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedCategory = index;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(46),
                                color: selectedCategory == index
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                            child: Row(
                              children: [
                                Icon(
                                  IconCategory[index],
                                  size: 24,
                                  color: selectedCategory == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  categoryItems[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: selectedCategory == index
                                              ? Theme.of(context).primaryColor
                                              : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: categoryItems.length,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream: FirebaseManager.getEvent(categoryItems[selectedCategory]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text("Something Went Wrong, Please Try Again Later!"));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return EventItem(
                  model: snapshot.data!.docs[index].data(),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: snapshot.data?.docs.length ?? 0,
            ),
          );
        },
      ),
    );
  }
}
