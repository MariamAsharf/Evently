import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebase_manager.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/screens/create_event.dart';

class EventItem extends StatelessWidget {
  TaskModel model;

  EventItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("assets/images/${model.category}.png"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${model.title}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          CreateEvent.routeName,
                          arguments: model,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () => FirebaseManager.deleteTask(model.id),
                        child: Icon(
                          Icons.delete,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => FirebaseManager.favouriteTask(
                          model.id, model.isFavourite),
                      child: Icon(
                        model.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 8, top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).scaffoldBackgroundColor),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "${convertMillisToDayMonth(model.date).split(" ")[0]}\n",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  TextSpan(
                    text:
                        "${convertMillisToDayMonth(model.date).split(" ")[1].substring(0, 3)}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String convertMillisToDayMonth(int millis) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millis);
    return '${date.day} ${_getMonthName(date.month)}';
  }

  String _getMonthName(int month) {
    const monthNames = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month];
  }
}
