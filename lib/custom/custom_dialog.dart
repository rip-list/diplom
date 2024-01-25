import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: null,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      contentTextStyle: const TextStyle(color: Colors.white),
      title: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.red, AppColors.blue]),
          borderRadius: BorderRadius.all(Radius.circular(26)),
        ),
        child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Внимание ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(" Введены пустые значения")
                ],
              ),
            )),
      ),
    );
  }
}
