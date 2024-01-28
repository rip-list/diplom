import 'package:flutter/material.dart';
import 'package:diplom/constant/import_const.dart';

class BlockTasks extends StatefulWidget {
  const BlockTasks({super.key});

  @override
  State<BlockTasks> createState() => _BlockTasksState();
}

class _BlockTasksState extends State<BlockTasks> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Column(
      children: [
        Text(userProvider.taskTitle!),
        Text(userProvider.taskDescription!),
      ],
    );
  }
}
