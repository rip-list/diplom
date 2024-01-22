//тут говнокод, надо переделать в отдельный блок с параметрами нахер

import 'package:diplom/constant/app_color.dart';
import 'package:flutter/material.dart';

class CommentMsg extends StatefulWidget {
  const CommentMsg({super.key});

  @override
  State<CommentMsg> createState() => CommentMsgState();
}

class CommentMsgState extends State<CommentMsg> {
  final TextEditingController teLogin = TextEditingController();
  final TextEditingController tePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      height: 230,
      alignment: Alignment.center,
      width: 600,
      child: Column(
        children: [
          TextField(
            controller: teLogin,
            style: const TextStyle(
              color: AppColors.white,
            ),
            decoration: const InputDecoration(
              hintText: 'Input Login',
              filled: true,
              fillColor: AppColors.primary,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide(color: AppColors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide(color: AppColors.blue),
              ),
              hintStyle: TextStyle(color: AppColors.white),
              // Свойство style изменяет цвет введенного текста.
            ),
          ),
          const SizedBox(
            width: 40,
            height: 30,
          ),
          TextField(
            controller: tePassword,
            style: const TextStyle(color: AppColors.white),
            decoration: const InputDecoration(
              hintText: 'Input Password',
              filled: true,
              fillColor: AppColors.primary,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide(color: AppColors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide(color: AppColors.blue),
              ),
              hintStyle: TextStyle(color: AppColors.white),
              // Свойство style изменяет цвет введенного текста.
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            height: 50,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.primary)),
              onPressed: () async {
                // вставка значения в бд
              },
              child: const Text(
                'Send',
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
