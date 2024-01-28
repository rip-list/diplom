import 'package:diplom/constant/app_color.dart';
import 'package:diplom/constant/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlockMake extends StatefulWidget {
  const BlockMake({super.key});

  @override
  State<BlockMake> createState() => _BlockMakeState();
}

class _BlockMakeState extends State<BlockMake> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    String id = userProvider.userId ?? "0";
    return Container(
      color: AppColors.secondary,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [Text(id)],
      ),
    );
  }
}
