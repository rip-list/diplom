// ignore_for_file: avoid_print

import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> insertAuto(String username, String password) async {
  final url = Uri.parse(
      'http://localhost:3000/diplom/data_user'); // Заменить 'your_server_ip' на IP-адрес сервера
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'username': username, 'password': password});

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print('User created successfully');
    } else {
      print('Failed to create user. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error creating user: $error');
  }
}
