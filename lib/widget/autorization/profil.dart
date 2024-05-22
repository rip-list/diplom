import 'package:diplom/constant/restart_app.dart';
import 'package:diplom/lib/database/localbd/lodindb.dart';
import 'package:diplom/widget/autorization/change_avatar.dart';
import 'package:flutter/material.dart';
import 'package:diplom/constant/import_const.dart'; // Проверьте, что путь к этому файлу указан правильно
import 'package:shared_preferences/shared_preferences.dart';
// import "package:diplom/constant/restart_app.dart";
// import 'package:diplom/lib/database/localbd/lodindb.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key); // Добавил параметр Key? key

  @override
  // ignore: library_private_types_in_public_api
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String firstname = '';
  String lastname = '';
  String patronum = ' ';
  String name = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

// получение имени фамилии отчества
  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString("First Name");
    String? lastName = prefs.getString("Last Name");
    String? paTronum = prefs.getString("Patronum");
    name = "$firstName $lastName $paTronum";

    setState(
      () {
        firstname = firstName ?? "error found";
        lastname = lastName ?? "error found";
        patronum = paTronum ?? "error found";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkblue,
        centerTitle: true,
        title: const Text(
          " PROFILE",
          style: TextStyle(fontFamily: 'Jojo', color: AppColors.blue),
        ),
      ),
      body: Scaffold(
        body: Column(
          children: [
            const Expanded(flex: 3, child: _TopPortion()),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.white),
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
                          icon: const Icon(
                            Icons.message_rounded,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    const ImagePickerScreen()),
                              ),
                            );
                          },
                          elevation: 0,
                          heroTag: "change_avatar",
                          backgroundColor: AppColors.green,
                          label: const Text(
                            "Change Avatar",
                            style: TextStyle(color: AppColors.white),
                          ),
                          icon: const Icon(
                            Icons.person_remove_sharp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // const _ProfileInfoRow()
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColors.blue, Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
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
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
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
