import 'package:diplom/constant/app_color.dart';
import 'package:diplom/lib/database/bd.dart';
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
              await insertAuto(teLogin.text, tePassword.text);
            },
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: AppColors.white,
      ),
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.primary,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        hintStyle: const TextStyle(color: AppColors.white),
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
