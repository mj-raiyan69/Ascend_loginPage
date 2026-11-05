import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Main App Colors
  static const Color background = Color(0xFF0A0A0B);
  static const Color cardColor = Color(0xFF18181C);
  static const Color gold = Color(0xFFC9A84C);
  static const Color textWhite = Color(0xFFF0F0EE);
  static const Color textGrey = Colors.grey;

  // Main Theme Setup
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: gold,
    //textTheme: GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme),
  );

  // Simple title text style
  static TextStyle titleStyle = GoogleFonts.barlowCondensed(
    fontSize: 48,
    fontWeight: FontWeight.w900,
    color: gold,
    letterSpacing: 1.5,
  );
}