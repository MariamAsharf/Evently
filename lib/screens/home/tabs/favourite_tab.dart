import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/screens/home/tabs/home_tab/event_item.dart';

class FavouriteTab extends StatefulWidget {
  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Favourites")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: "Search",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<TaskModel>>(
              stream: FirebaseManager.getFavouriteEvents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error loading favourites"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No favourite events yet!"));
                }

                var filteredEvents = snapshot.data!.where((event) {
                  return event.title.toLowerCase().contains(searchQuery) ||
                      event.description.toLowerCase().contains(searchQuery);
                }).toList();

                if (filteredEvents.isEmpty) {
                  return Center(child: Text("No events found!"));
                }

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return EventItem(model: filteredEvents[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: filteredEvents.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
