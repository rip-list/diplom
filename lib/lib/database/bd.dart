// ignore_for_file: avoid_print,

import 'dart:async';
import 'dart:convert';
import 'package:diplom/widget/autorization/home_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../constant/user_provider.dart';

// отправка данных
// final get userid;
final url = Uri.parse('http://localhost:3000/diplom/data_user');
final headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

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

Future<void> checkUser(
    BuildContext context, String username, String password) async {
  try {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final response = await http.post(
      Uri.parse('http://localhost:3000/diplom/checkUser'),
      headers: headers,
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['success'] == true) {
        final userId = responseBody['user_id'];
        print('Credentials are valid, user_id: $userId');
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeLogin()),
        );
        userProvider.setUserId(userId);
      } else {
        print('Invalid credentials. Response: ${response.body}');
      }
    } else {
      print('Server error. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error checking user: $error');
  }
}
