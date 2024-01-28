import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? userId;

  bool _mounted = true;

  // Геттер для доступа к состоянию mounted
  bool get mounted => _mounted;

  // Ваш код для установки _mounted в false при удалении виджета
  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  void setUserId(String id) {
    userId = id;
    notifyListeners();
  }
}
