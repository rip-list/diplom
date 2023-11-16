// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import "package:diplom/constant/app_color.dart";

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
        color: AppColors.secondary,
        child: Row(children: [
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: AppColors.grey,
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: AppColors.grey,
                  ),
                ),
                Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
