import 'package:diplom/constant/app_color.dart';
import 'package:flutter/material.dart';

class BlockMake extends StatefulWidget {
  const BlockMake({super.key});

  @override
  State<BlockMake> createState() => _BlockMakeState();
}

class _BlockMakeState extends State<BlockMake> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
      child: const Row(children: []),
    );
  }
}

class WorkME extends StatelessWidget {
  const WorkME({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
