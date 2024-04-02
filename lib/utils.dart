import 'package:flutter/material.dart';

Widget buildPriorityDot(String priority) {
  Color dotColor;
  switch (priority.toLowerCase()) {
    case 'high':
      dotColor = Colors.red;
      break;
    case 'medium':
      dotColor = Colors.green;
      break;
    case 'low':
      dotColor = Colors.blue;
      break;
    default:
      dotColor = Colors.black;
  }

  return Container(
    width: 10,
    height: 10,
    margin: EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: dotColor,
    ),
  );
}
