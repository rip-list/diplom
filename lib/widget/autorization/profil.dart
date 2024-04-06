import 'package:flutter/material.dart';
import 'package:diplom/constant/import_const.dart'; // Проверьте, что путь к этому файлу указан правильно
import 'package:shared_preferences/shared_preferences.dart';

import 'package:diplom/lib/database/localbd/lodindb.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key); // Добавил параметр Key? key

  @override
  // ignore: library_private_types_in_public_api
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String firstname = '';
  String lastname = '';
  String patronum = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString("First Name");
    String? lastName = prefs.getString("Last Name");
    String? patronum = prefs.getString("Patronum");

    setState(() {
      firstname = firstName ?? "error found";
      lastname = lastName ?? "error found";
      patronum = patronum ?? "error found";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          " PROFILE",
          style: TextStyle(fontFamily: 'Jojo', color: AppColors.blue),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstname,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              lastname,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              patronum,
              style: const TextStyle(fontSize: 24),
            ),
            const IconButton(
              onPressed:
                  delAuthToken, // Убедитесь, что метод delAuthToken определен
              icon: Icon(Icons.delete_sweep_outlined),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
