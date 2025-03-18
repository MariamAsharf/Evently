import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
  List<String> categoryItems = [
    "birthday",
    "Book Club",
    "exhibitation",
    "sports",
    "holiday",
    "meeting",
    "gaming",
    "work shop",
    "eating",
  ];

  List<IconData> IconCategory = [
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

  String get selectedCategoryName => categoryItems[selectedCategory];

  int selectedCategory = 0;

  changeCategoru(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();

  changeData(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
