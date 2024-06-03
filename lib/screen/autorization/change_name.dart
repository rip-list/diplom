import 'package:flutter/material.dart';
import 'package:diplom/custom/name_fild.dart';
import 'package:diplom/constant/app_color.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({super.key});

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  final TextEditingController newname = TextEditingController();
  final TextEditingController newpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // color: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.blue,
        ),
        backgroundColor: AppColors.primary,
        title: const Text(
          'Change Name',
          style: TextStyle(
            color: AppColors.blue,
            fontFamily: "Jojo",
            fontSize: 24,
          ),
        ),
      ),
      body: const SetFioFild(),
      backgroundColor: AppColors.secondary,
    );
  }
}
