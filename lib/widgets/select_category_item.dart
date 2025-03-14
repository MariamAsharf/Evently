import 'package:flutter/material.dart';

class SelectCategoryItem extends StatelessWidget {
  bool isSelected;
  String text;

  SelectCategoryItem({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(46),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent),
      child: Row(
        children: [
          Icon(
            Icons.sports_baseball_rounded,
            size: 24,
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color:
                    isSelected ? Colors.white : Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
