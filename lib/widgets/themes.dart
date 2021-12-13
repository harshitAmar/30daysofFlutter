// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Colors.teal,
      fontFamily: GoogleFonts.roboto().fontFamily,
      splashColor: Colors.teal.shade300,
      cardColor: Colors.teal.shade400,
      hintColor: Colors.teal.shade50,
      primaryColorDark: Colors.teal.shade100,
      shadowColor: Colors.teal.shade800,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 32,
        ),
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white24,
        fontFamily: GoogleFonts.roboto().fontFamily,
        splashColor: Colors.white54,
        cardColor: Colors.black,
        hintColor: Colors.white,
        primaryColorDark: Colors.white,
        focusColor: Colors.grey,
        shadowColor: Colors.black45,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 32,
          ),
        ),
      );
}
