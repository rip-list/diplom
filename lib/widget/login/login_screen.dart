// ignore_for_file: unnecessary_import

import 'package:diplom/constant/app_color.dart';
import 'package:diplom/widget/allert_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.blue,
      home: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            'Back',
            style: TextStyle(color: AppColors.blue, fontFamily: 'Jojo'),
          ),
          leading: IconButton(
            //кнопка возвращения назад
            color: AppColors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: const Center(
          child: LoginManager(),
        ),
      ),
    );
  }
}

class LoginManager extends StatelessWidget {
  const LoginManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.center,
      child: Container(
        height: 450,
        width: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: AppColors.grey,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ваши виджеты для LoginManager
            Align(
              alignment: Alignment.bottomCenter,
              child: CommentMsg(),
            )
          ],
        ),
      ),
    );
  }
}
