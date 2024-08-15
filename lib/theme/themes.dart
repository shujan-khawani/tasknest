import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light Mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.montagaTextTheme(
    ThemeData.light().textTheme,
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFEEEEEE),
    primary: Colors.green,
    secondary: Colors.white,
    onSecondary: Colors.black,
  ),
);

// Dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.openSansTextTheme(
    ThemeData.light().textTheme,
  ),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF212121),
    primary: Colors.green,
    secondary: Colors.black,
    onSecondary: Colors.white,
  ),
);
