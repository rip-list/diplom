import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? userId;
  String? taskTitle;
  String? taskDescription;

  void setUserId(String id) {
    userId = id;
    notifyListeners();
  }

  void setTask(String? taskTitle, String? taskDescription) {
    taskTitle = taskTitle;
    taskDescription = taskDescription;
    notifyListeners();
  }
}
