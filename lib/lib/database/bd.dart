// ignore_for_file: avoid_print,
// ignore_for_file: use_build_context_synchronously
import 'package:diplom/lib/check/lodindb.dart';
import 'dart:async';
import 'dart:convert';
import 'package:diplom/widget/autorization/home_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../custom/import_lib.dart';
import '../../constant/import_const.dart';

final url = Uri.parse('http://localhost:3000/diplom/data_user');
final headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
};

// registration
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

// pars data
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

// autorization
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

    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody['success'] == true) {
      final userId = responseBody['user_id'];
      final Map<String, dynamic> jsonData = responseBody;
      final List<dynamic> tasks = jsonData['tasks'];
      final Map<String, dynamic> task = tasks[0];
      final TaskData taskData = TaskData.fromJson(task);

      saveAuthToken(userId);

      print('Credentials are valid, user_id: $userId');
      print('Credentials are valid, tasksTitle: ${taskData.title}');

      if (taskData.title != null) {
        userProvider.setTask(taskData.title, taskData.description);
      } else {
        userProvider.setTask("Нет заданий", "");
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeLogin()),
      );
      userProvider.setUserId(userId);
    } else {
      print('Server error. Status code: ${response.statusCode}');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialog();
        },
      );
    }
  } catch (error) {
    print('Error checking user: $error');
  }
}

Future<void> updateData(String userid) async {}

class TaskData {
  String? title;
  String? description;

  TaskData({required this.title, required this.description});

  factory TaskData.fromJson(Map<String, dynamic> json) {
    return TaskData(
      title: json['title'],
      description: json['description'],
    );
  }
}
