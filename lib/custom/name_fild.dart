// ignore_for_file: avoid_print, unused_import

import 'package:diplom/constant/app_color.dart';
import 'package:diplom/custom/custom_dialog.dart';
import 'package:diplom/lib/database/localbd/bd.dart';
import 'package:diplom/lib/database/localbd/lodindb.dart';
import 'package:flutter/material.dart';

import '../custom/custom_fild.dart';

class SetFioFild extends StatefulWidget {
  const SetFioFild({super.key});

  @override
  State<SetFioFild> createState() => CommentMsgState();
}

class CommentMsgState extends State<SetFioFild> {
  final TextEditingController newFirstName = TextEditingController();
  final TextEditingController newLastName = TextEditingController();
  final TextEditingController newPatronum = TextEditingController();
  String oldFirstName = "";
  String oldLastName = "";
  String oldPatronum = "";

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    String firstName = await getFirstName();
    String lastName = await getLastName();
    String patronum = await getPatronum();

    setState(() {
      oldFirstName = firstName;
      oldLastName = lastName;
      oldPatronum = patronum;
    });
  }

  @override
  Widget build(BuildContext context) {
    double adaptiveHeight = MediaQuery.of(context).size.height * 0.03;
    double adaptiveWidth = MediaQuery.of(context).size.width * 0.01;

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.9,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(13, 20),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.2,
              alignment: Alignment.center,
              child: const Text(
                "  Input First Name  ",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: adaptiveHeight,
              width: adaptiveWidth,
            ),
            InputField(
              controller: newFirstName,
              hintText: oldFirstName,
            ),
            SizedBox(
              height: adaptiveHeight,
              width: adaptiveWidth,
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(13, 20),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.2,
              alignment: Alignment.center,
              child: const Text(
                " Input Last Name ",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: adaptiveHeight,
              width: adaptiveWidth,
            ),
            InputField(
              controller: newLastName,
              hintText: oldLastName,
            ),
            SizedBox(
              height: adaptiveHeight,
              width: adaptiveWidth,
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(13, 20),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.2,
              alignment: Alignment.center,
              child: const Text(
                " Input Patronum ",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: adaptiveHeight,
              width: adaptiveWidth,
            ),
            InputField(
              controller: newPatronum,
              hintText: oldPatronum,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.076,
              width: 1,
            ),
            SendButton(
              onPressed: () async {
                if (newFirstName.text == "") {
                  newFirstName.text = oldFirstName;
                }
                if (newLastName.text == "") {
                  newLastName.text = oldLastName;
                }
                if (newPatronum.text == "") {
                  newPatronum.text = oldPatronum;
                }
                updateName(
                  newFirstName.text,
                  newPatronum.text,
                  newLastName.text,
                );
              },
            )
          ],
        ),
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
        border: Border(bottom: BorderSide(color: AppColors.white)),
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
