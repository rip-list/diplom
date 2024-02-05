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
