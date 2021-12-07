import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get themedata => ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        shadowColor: Colors.teal.shade100,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
            size: 32,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
