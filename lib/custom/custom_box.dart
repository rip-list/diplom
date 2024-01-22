import 'package:diplom/constant/app_color.dart';
import 'package:flutter/material.dart';

class CusBox extends StatefulWidget {
  final double height;
  final double width;
  final String textButton;
  final Color color;

  const CusBox({
    Key? key,
    required this.height,
    required this.width,
    required this.textButton,
    this.color = AppColors.grey,
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
                  onPressed: null,
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
                // Другие виджеты...
              ],
            ),
          );
        },
      ),
    );
  }
}
