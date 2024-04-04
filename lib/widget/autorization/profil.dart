// ignore_for_file: unused_import

import 'package:diplom/lib/check/lodindb.dart';
import 'package:flutter/material.dart';
import "package:diplom/constant/import_const.dart";

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          " PROFILE",
          style: TextStyle(fontFamily: 'Jojo'),
        ),
      ),
      body: const Column(
        children: [
          IconButton(
              onPressed: delAuthToken, icon: Icon(Icons.delete_sweep_outlined))
        ],
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
