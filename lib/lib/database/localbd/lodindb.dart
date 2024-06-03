// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

// Пример сохранения данных в SharedPreferences
Future<void> saveAuthToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('authToken', token);
}

Future<void> saveTaskId(String taskId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('taskId', taskId);
}

// Пример чтения данных из SharedPreferences
Future<String?> getAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('authToken');
}

Future<bool> checkUserAuthentication() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? authToken = prefs.getString('authToken');

  return authToken != null; // Вернет true, если есть токен
}

Future<void> delAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

// сохранения данных именни
Future<void> saveFirstName(String firstName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('First Name', firstName);
}

Future<String> getFirstName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? firstName = prefs.getString('First Name');
  if (firstName != null) {
    return firstName;
  } else {
    return 'rip'; // Возвращаем значение по умолчанию, если firstName = null
  }
}

Future<String> getLastName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? lastName = prefs.getString('Last Name');
  if (lastName != null) {
    return lastName;
  } else {
    return 'да? вопросы не принимаются';
  }
}

Future<String> getPatronum() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? patronum = prefs.getString('Patronum');
  if (patronum != null) {
    return patronum;
  } else {
    return 'да? вопросы не принимаются';
  }
}

// сохранения данных фамилии
Future<void> saveLastName(String lastName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Last Name', lastName);
}

// сохранения данных отчества
Future<void> savePatronum(String patronum) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Patronum', patronum);
}

// save avatar link

Future<void> saveAvatarUrl(String newAvatarUrl) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('avatarUrl', newAvatarUrl);
}
