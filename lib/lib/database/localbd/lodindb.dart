// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

// Пример сохранения данных в SharedPreferences
Future<void> saveAuthToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('authToken', token);
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
