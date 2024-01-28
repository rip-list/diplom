// ignore_for_file: avoid_init_to_null

import 'package:diplom/constant/app_color.dart';
import 'package:flutter/material.dart';

class CusBox extends StatefulWidget {
  final double height;
  final double width;
  final String textButton;
  final Color color;
  final VoidCallback? onPressed;
  final Widget body;
  
  
  const CusBox({
    Key? key,
    required this.height,
    required this.width,
    required this.textButton,
    required this.body,
    this.color = AppColors.grey,
    this.onPressed = null,
  }) : super(key: key);

  @override
  CusBoxState createState() => CusBoxState();
}

class CusBoxState extends State<CusBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.height,
      width: MediaQuery.of(context).size.width * widget.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  offset: const Offset(3, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                TextButton(
                  onPressed: widget.onPressed,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      widget.textButton,
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 20.0,
                  left: 0,
                  right: 0,
                  child: Divider(
                    color: AppColors.blue,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
