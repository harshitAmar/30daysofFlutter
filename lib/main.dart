// ignore_for_file: prefer_const_constructors

import 'package:firstapp/pages/cart_page.dart';
import 'package:firstapp/pages/homepage.dart';
import 'package:firstapp/pages/loginpage.dart';
import 'package:firstapp/utils/routes.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => Cart(),
      },
    );
  }
}
