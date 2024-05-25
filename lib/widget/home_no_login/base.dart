import 'package:diplom/constant/import_const.dart';
import 'package:diplom/widget/autorization/home_login.dart';
import 'package:flutter/material.dart';
import 'home_no_login.dart';
import 'package:diplom/lib/database/localbd/lodindb.dart';
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
                theme: ThemeData(
                  primaryColor: AppColors.secondary,
                  hintColor: AppColors.blue,
                  appBarTheme: const AppBarTheme(
                    centerTitle: true,
                    color: AppColors.primary,
                    iconTheme: IconThemeData(
                      color: AppColors.white,
                    ),
                    titleTextStyle: TextStyle(
                        fontFamily: "Jojo",
                        fontSize: 28,
                        color: AppColors.blue),
                  ),
                ),
                home: FutureBuilder(
                    future: checkUserAuthentication(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == true) {
                          return const HomeLogin();
                        } else {
                          return const HomeNoLogin();
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              );
            },
          );
        },
      ),
    );
  }
}
