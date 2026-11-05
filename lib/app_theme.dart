import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color bg = Color(0xFF0A0A0B);
  static const Color surface = Color(0xFF111113);
  static const Color surface2 = Color(0xFF18181C);
  static const Color border = Color(0x12FFFFFF);  // rgba(255,255,255,0.07)
  static const Color border2 = Color(0x1FFFFFFF); // rgba(255,255,255,0.12)

  static const Color gold = Color(0xFFC9A84C);
  static const Color goldLight = Color(0xFFE8C97A);
  static const Color goldDim = Color(0x26C9A84C);
  static const Color goldDim2 = Color(0x14C9A84C);

  static const Color text = Color(0xFFF0F0EE);
  static const Color textMuted = Color(0xFF7A7A82);
  static const Color textSub = Color(0xFF4A4A52);

  static const Color errorRed = Color(0xFFC94C4C);
  static const Color successGreen = Color(0xFF4CB88C);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.bg,
      brightness: Brightness.dark,
      primaryColor: AppColors.gold,
      // textTheme: GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme).apply(
      //   bodyColor: AppColors.text,
      //   displayColor: AppColors.text,
      // ),
    );
  }

  static TextStyle barlow({
    double size = 20,
    FontWeight weight = FontWeight.w800,
    Color color = AppColors.text,
    double letterSpacing = 0,
    double height = 1.0,
  }) {
    return GoogleFonts.barlowCondensed(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}