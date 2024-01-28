import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class CustomDialog extends StatelessWidget {
  final String titleText;
  final String subTitle;
  const CustomDialog({Key? key, this.titleText = '', this.subTitle = ''})
      : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  // title
                  titleText,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(subTitle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
