// ignore_for_file: avoid_unnecessary_containers, unnecessary_import, prefer_const_literals_to_create_immutables

import 'package:diplom/custom/custom_box.dart';
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
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.secondary,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Row(
            children: [
              CusBox(height: 0.9, width: 0.4),
              Column(
                children: [
                  SizedBox(width: 20),
                  CusBox(height: 0.439, width: 0.56),
                  CusBox(height: 0.439, width: 0.56),
                ],
              ),

              // CusBox(height: 0.44, width: 0.57),
            ],
          ),
        ),
      ),
    );
  }
}
