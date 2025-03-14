import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
  List<String> categoryItems = [
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

  String get selectedCategoryName => categoryItems[selectedCategory];

  int selectedCategory = 0;

  changeCategoru(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  DateTime selectedDate = DateTime.now();

  changeData(DateTime date){
    selectedDate = date;
    notifyListeners();
  }
}
