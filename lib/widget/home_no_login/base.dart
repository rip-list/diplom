import 'package:diplom/constant/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_no_login.dart';
import 'package:diplom/lib/sized_screen/sizer_util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // Другие провайдеры, если они есть
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizerUtil().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Sizer',
                theme: ThemeData.dark(),
                home: const HomeNoLogin(),
              );
            },
          );
        },
      ),
    );
  }
}
