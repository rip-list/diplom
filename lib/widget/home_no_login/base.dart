import 'package:flutter/material.dart';
import 'home_no_login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "FlyWritE",
      home: HomeNoLogin(),
    );
  }
}
