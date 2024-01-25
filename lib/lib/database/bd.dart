// ignore_for_file: avoid_print

import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;

final url = Uri.parse(
    'http://localhost:3000/diplom/data_user'); // Заменить 'your_server_ip' на IP-адрес сервера
final headers = {'Content-Type': 'application/json'};

// отправка данных

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

// полученние данных
Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('https://example.com/api/data'));

  if (response.statusCode == 200) {
    // Если запрос успешен, декодируем данные из JSON
    return json.decode(response.body);
  } else {
    // Если запрос неудачен, выведите сообщение об ошибке
    throw Exception('Failed to load data');
  }
}
