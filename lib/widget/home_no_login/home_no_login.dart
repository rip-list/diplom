// ignore_for_file: avoid_unnecessary_containers, unnecessary_import, prefer_const_literals_to_create_immutables

import 'package:diplom/custom/custom_box.dart';
import 'package:diplom/widget/login/login_screen.dart';
import 'package:flutter/material.dart';
import "package:diplom/constant/app_color.dart";
import 'package:flutter/rendering.dart';

class HomeNoLogin extends StatelessWidget {
  const HomeNoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FlyWritE",
          style: TextStyle(color: AppColors.blue),
        ),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.manage_accounts_rounded),
            onPressed: () {
              // Добавьте ваш обработчик события здесь
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.secondary,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Row(
            children: [
              Expanded(
                child: CusBox(
                  height: 0.9,
                  width: 0.4,
                  textButton: 'Сделай меня',
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: CusBox(
                        height: 0.4,
                        width: 0.55,
                        textButton: 'Назначенные задания',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: CusBox(
                        height: 0.4,
                        width: 0.55,
                        textButton: 'Поданные документы',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
