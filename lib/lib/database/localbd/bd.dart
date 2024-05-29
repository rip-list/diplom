// ignore_for_file: avoid_print,, unused_import
// ignore_for_file: use_build_context_synchronously

import 'package:diplom/lib/database/localbd/lodindb.dart';
import 'dart:async';
import 'dart:convert';
import 'package:diplom/widget/autorization/home_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../custom/import_lib.dart';
import '../../../constant/import_const.dart';

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
// save data in  local
    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody['success'] == true) {
      final userId = responseBody['user_id'];
      final firstName = responseBody["firstName"];
      final lastName = responseBody["lastName"];
      final patronum = responseBody["patronum"];

      final Map<String, dynamic> jsonData = responseBody;
      final List<dynamic> tasks = jsonData['tasks'];
      final Map<String, dynamic> task = tasks[0];
      final TaskData taskData = TaskData.fromJson(task);
      print(responseBody);
      saveAuthToken(userId);
      saveFirstName(firstName);
      saveLastName(lastName);
      savePatronum(patronum);

      print('Credentials are valid, user_id: $userId');
      print(
          'Credentials are valid, tasksTitle: ${taskData.title} ${taskData.description}}');

      if (taskData.title != null) {
        userProvider.setTask(taskData.title, taskData.description);
      } else {
        userProvider.setTask("Нет заданий", "");
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeLogin()),
      );
      // save userID in local bd
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

// обработка задач
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

// seve image or server
Future<String> saveAvatar() async {
  try {
    final userId =
        await getAuthToken(); // Предполагается, что getAuthToken возвращает userId
    final response =
        await http.get(Uri.parse('http://localhost:3000/get-avatar/$userId'));

    if (response.statusCode == 200) {
      print('Successful');
      String imgdata = 'http://localhost:3000/get-avatar/$userId';
      return imgdata;
    } else {
      String err =
          "https://sneg.top/uploads/posts/2023-06/1687993484_sneg-top-p-neitralnaya-avatarka-na-vatsap-pinterest-5.jpg";
      print("Failed to load image: ${response.statusCode}");
      return err;
    }
  } catch (error) {
    print("Server returned error: $error");

    String err =
        "https://sneg.top/uploads/posts/2023-06/1687993484_sneg-top-p-neitralnaya-avatarka-na-vatsap-pinterest-5.jpg";
    return err;
  }
}
