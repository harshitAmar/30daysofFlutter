import 'package:firstapp/pages/homepage.dart';
import 'package:firstapp/pages/loginpage.dart';
import 'package:firstapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        shadowColor: Colors.teal.shade100,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.green.shade400,
          elevation: 12,
          iconTheme: const IconThemeData(
            color: Colors.black87,
          ),
        ),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        "/": (context) => LoginPage(),
      },
    );
  }
}
