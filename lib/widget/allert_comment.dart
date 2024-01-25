// ignore_for_file: avoid_print

import 'package:diplom/constant/app_color.dart';
import 'package:diplom/custom/custom_dialog.dart';
import 'package:diplom/lib/database/bd.dart';
import 'package:flutter/material.dart';

import '../custom/custom_fild.dart';

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
    return Container(
      height: 230,
      alignment: Alignment.center,
      width: 600,
      child: Column(
        children: [
          InputField(
            controller: teLogin,
            hintText: 'Input Login',
          ),
          const SizedBox(
            width: 40,
            height: 30,
          ),
          InputField(
            controller: tePassword,
            hintText: 'Input Password',
            isPassword: true,
          ),
          const SizedBox(
            height: 10,
          ),
          SendButton(
            onPressed: () async {
              if (teLogin.text.isEmpty || tePassword.text.isEmpty) {
                // Один или оба поля пусты
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const CustomDialog();
                  },
                );
              } else {
                // Оба поля заполнены, выполните вашу логику.
                await insertAuto(teLogin.text, tePassword.text);
              }
            },
          ),
        ],
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SendButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          backgroundColor: MaterialStatePropertyAll(AppColors.primary),
        ),
        onPressed: onPressed,
        child: const Text(
          'Send',
          style: TextStyle(color: AppColors.white, fontSize: 14),
        ),
      ),
    );
  }
}
