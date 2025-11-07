import 'package:flutter/material.dart';

enum PaletteChoice { Pink }

class GalaxyPinkTheme {
  static const Color spaceBase = Color(0xFF0A021A);
  static const Color neonPink = Color(0xFFFF4EB8);
  static const Color neonPurple = Color(0xFFB974FF);
  static const Color glowPink = Color(0xFFFF9CEB);
  static const Color textSoft = Color(0xFFF7E9FF);

  static ThemeData getTheme(PaletteChoice p) {
    // currently only Pink implemented
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: spaceBase,
      primaryColor: neonPink,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: textSoft),
        titleLarge: TextStyle(
          color: textSoft,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
      ),
    );
  }

  // glass container decoration
  static BoxDecoration glassDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: neonPink.withOpacity(0.22), width: 1.0),
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.06),
          Colors.white.withOpacity(0.02),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: neonPink.withOpacity(0.14),
          blurRadius: 20,
          spreadRadius: 1,
          offset: const Offset(0, 6),
        ),
        BoxShadow(
          color: neonPurple.withOpacity(0.06),
          blurRadius: 30,
          spreadRadius: 4,
          offset: const Offset(0, 12),
        ),
      ],
    );
  }
}
