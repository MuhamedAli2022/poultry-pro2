import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Colors
  static const Color darkBg = Color(0xFF0a0a1a);
  static const Color darkBgLight = Color(0xFF12122a);
  static const Color darkCard = Color(0xFF1a1a3a);
  static const Color darkText = Color(0xFFe8e8f0);
  static const Color darkTextDim = Color(0xFF8888a0);

  // Light Colors
  static const Color lightBg = Color(0xFFf0f2f5);
  static const Color lightCard = Color(0xFFffffff);
  static const Color lightText = Color(0xFF1a1a2e);
  static const Color lightTextDim = Color(0xFF4a4a6a);

  // Accent Colors
  static const Color accent = Color(0xFF00d4aa);
  static const Color accentGlow = Color(0xFF00a080);
  static const Color danger = Color(0xFFff4757);
  static const Color warning = Color(0xFFffa502);
  static const Color info = Color(0xFF3742fa);
  static const Color purple = Color(0xFFa55eea);
  static const Color gold = Color(0xFFffd700);

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: accent,
      scaffoldBackgroundColor: darkBg,
      fontFamily: 'Cairo',
      textTheme: TextTheme(
        displayLarge: GoogleFonts.cairo(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: darkText,
        ),
        headlineSmall: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: darkText,
        ),
        titleMedium: GoogleFonts.cairo(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: darkText,
        ),
        bodyMedium: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: darkTextDim,
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: accent,
        secondary: purple,
        surface: darkCard,
        error: danger,
      ),
    );
  }

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: accent,
      scaffoldBackgroundColor: lightBg,
      fontFamily: 'Cairo',
      textTheme: TextTheme(
        displayLarge: GoogleFonts.cairo(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: lightText,
        ),
        headlineSmall: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: lightText,
        ),
        titleMedium: GoogleFonts.cairo(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: lightText,
        ),
        bodyMedium: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: lightTextDim,
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: accent,
        secondary: purple,
        surface: lightCard,
        error: danger,
      ),
    );
  }
}
