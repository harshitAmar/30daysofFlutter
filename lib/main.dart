import 'package:firstapp/loginpage.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

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
          scaffoldBackgroundColor: Colors.teal.shade100,
          shadowColor: Colors.teal.shade100,
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.green.shade400,
              elevation: 12,
              iconTheme: const IconThemeData(
                color: Colors.black87,
              ))),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
