import 'package:diplom/constant/app_color.dart';
import 'package:flutter/material.dart';

class CusBox extends StatelessWidget {
  final double height;
  final double width;
  const CusBox({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Добавленный SizedBox
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: AppColors.grey,
              boxShadow: [
                BoxShadow(
                    color: AppColors.primary.withOpacity(0.5),
                    offset: const Offset(3, 5))
              ]),
        );
      }),
    );
  }
}
