import 'package:flutter/material.dart';


class Task {
  final String title;
  final String description;
  final bool priority;
  final DateTime date;

  Task({
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
  });
}
class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title, String description, DateTime date, bool priority) {
    _tasks.add(Task(
      title: title,
      description: description,
      date: date,
      priority:priority ,
    ));
    notifyListeners();
    print("added");
  }


  void remove(tasks) {
    _tasks.remove(tasks);
    notifyListeners();
  }
}