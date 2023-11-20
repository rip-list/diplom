import 'package:diplom/constant/app_color.dart';
import 'package:flutter/material.dart';

class CusBox extends StatelessWidget {
  final double height;
  final double width;
  final String textButton;
  const CusBox(
      {super.key,
      required this.height,
      required this.width,
      required this.textButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Добавленный SizedBox
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: AppColors.grey,
              boxShadow: [
                BoxShadow(
                    color: AppColors.primary.withOpacity(0.5),
                    offset: const Offset(3, 5))
              ],
            ),
            child: Stack(
              children: [
                TextButton(
                  // ignore: avoid_print
                  onPressed: null,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      textButton,
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 20.0,
                  left: 0, // Можно также указать отступ слева
                  right: 0, // Или отступ справа
                  child: Divider(
                    color: AppColors.blue,
                    thickness: 1.0,
                  ),
                ),
                // Другие виджеты...
              ],
            ),
          );
        },
      ),
    );
  }
}
