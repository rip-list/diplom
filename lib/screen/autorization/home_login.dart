// ignore_for_file: avoid_unnecessary_containers, unnecessary_import, prefer_const_literals_to_create_immutables
import 'package:diplom/custom/import_lib.dart';
import 'package:diplom/constant/import_bloc.dart';
import 'package:flutter/material.dart';
import "package:diplom/constant/import_const.dart";
import 'package:flutter/rendering.dart';

import 'profil.dart';

class HomeLogin extends StatelessWidget {
  const HomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FlyWritE",
          style: TextStyle(
            color: AppColors.blue,
            fontFamily: 'Jojo',
            fontSize: 30,
          ),
        ),
        backgroundColor: AppColors.primary,
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(23),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
            },
            child: const Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.account_circle_rounded,
                      color: AppColors.blue,
                    ),
                    tooltip: "login",
                    focusColor: AppColors.blue,
                    onPressed: null),
                SizedBox(width: 8),
                Text(
                  "Login",
                  style: TextStyle(color: AppColors.blue, fontFamily: 'Jojo'),
                ),
              ],
            ),
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
                child: CustomBoxLogin(
                  height: 0.9,
                  width: 0.4,
                  textButton: 'Сделай меня',
                  body: BlockMake(),
                  child: MakeScreen(),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: CustomBoxLogin(
                        height: 0.4,
                        width: 0.55,
                        textButton: 'Назначенные задания',
                        body: BlockTasks(),
                        child: TaskScreen(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: CustomBoxLogin(
                        height: 0.4,
                        width: 0.55,
                        textButton: 'Поданные документы',
                        body: BlockDocs(),
                        child: DocsScreen(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
