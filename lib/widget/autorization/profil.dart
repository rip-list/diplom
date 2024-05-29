// ignore_for_file: library_private_types_in_public_api, unnecessary_this

import 'package:diplom/constant/restart_app.dart';
import 'package:diplom/lib/database/localbd/lodindb.dart';
import 'package:diplom/widget/autorization/change_avatar.dart';
import 'package:flutter/material.dart';
import 'package:diplom/constant/import_const.dart'; // Проверьте, что путь к этому файлу указан правильно
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String firstname = '';
  String lastname = '';
  String patronum = ' ';
  String name = '';
  String? avatarUrl;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Map<String, String?>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString("First Name");
    String? lastName = prefs.getString("Last Name");
    String? patronum = prefs.getString("Patronum");
    String? avatarUrl = prefs.getString("avatarUrl");

    return {
      'firstname': firstName ?? "error found",
      'lastname': lastName ?? "error found",
      'patronum': patronum ?? "error found",
      'avatarUrl': avatarUrl,
      'name': "$firstName $lastName $patronum",
    };
  }

  Future<void> saveAvatarUrl(String newAvatarUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('avatarUrl', newAvatarUrl);
    setState(() {
      avatarUrl = newAvatarUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkblue,
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: TextStyle(fontFamily: 'Jojo', color: AppColors.blue),
        ),
      ),
      body: FutureBuilder<Map<String, String?>>(
        future: getData(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, String?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final data = snapshot.data!;
            return Scaffold(
              body: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: _TopPortion(
                      strurl: data['avatarUrl'] ?? '',
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            data['name']!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.extended(
                                onPressed: () {
                                  delAuthToken();
                                  restartApp(context: context);
                                },
                                elevation: 0,
                                heroTag: "delite",
                                label: const Text(
                                  "Unlogin",
                                  style: TextStyle(color: AppColors.dark),
                                ),
                                backgroundColor: AppColors.red,
                                icon: const Icon(
                                  Icons.delete_sweep,
                                  color: AppColors.dark,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              FloatingActionButton.extended(
                                onPressed: () {},
                                heroTag: "change_name",
                                elevation: 0,
                                backgroundColor: AppColors.darkblue,
                                label: const Text(
                                  "Change Name",
                                  style: TextStyle(color: AppColors.white),
                                ),
                                icon: const Icon(Icons.message_rounded,
                                    color: AppColors.white),
                              ),
                              const SizedBox(width: 16.0),
                              FloatingActionButton.extended(
                                heroTag: "change_image",
                                onPressed: () async {
                                  final newAvatarUrl =
                                      await Navigator.push<String?>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ImagePickerScreen(),
                                    ),
                                  );
                                  if (newAvatarUrl != null) {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString(
                                        "avatarUrl", newAvatarUrl);
                                    setState(() {});
                                  }
                                },
                                elevation: 0,
                                backgroundColor: AppColors.orange,
                                label: const Text(
                                  "Change Avatar",
                                  style: TextStyle(color: AppColors.white),
                                ),
                                icon: const Icon(Icons.person_add_alt_1_sharp,
                                    color: AppColors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          FloatingActionButton.extended(
                            heroTag: "updatedata",
                            onPressed: () {
                              setState(() {}); // Обновляем состояние
                            },
                            elevation: 0,
                            backgroundColor: AppColors.dark,
                            label: const Text(
                              "Update Data",
                              style: TextStyle(color: AppColors.white),
                            ),
                            icon: const Icon(Icons.refresh,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.primary,
            );
          }
        },
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  final String strurl;
  const _TopPortion({Key? key, required this.strurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultUrl =
        "https://sneg.top/uploads/posts/2023-06/1687993484_sneg-top-p-neitralnaya-avatarka-na-vatsap-pinterest-5.jpg";
    final imageUrl = strurl.isEmpty ? defaultUrl : strurl;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [AppColors.blue, Color(0xff006df1)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(imageUrl), // Используем корректный URL
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
