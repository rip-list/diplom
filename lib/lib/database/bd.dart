// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// отправка данных
final url = Uri.parse('http://localhost:3000/diplom/data_user');
final headers = {'Content-Type': 'application/json'};

Future<void> insertAuto(String username, String password) async {
  final bodyInsert = jsonEncode({'username': username, 'password': password});

  try {
    final response = await http.post(url, headers: headers, body: bodyInsert);

    if (response.statusCode == 201) {
      print('User created successfully');
    } else {
      print('Failed to create user. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error creating user: $error');
  }
}

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error loading data: $error');
    return null;
  }
}

Future<bool> checkUser(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/diplom/checkUser'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print('Credentials are valid');
      return true;
    } else if (response.statusCode == 401) {
      print('Invalid credentials');
      return false;
    } else {
      print('Server error. Status code: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    print('Error checking user: $error');
    return false;
  }
}
