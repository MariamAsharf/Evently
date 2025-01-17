import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MYtheme {
  static const Color primaryColor = Color(0xFFF2FEFF);
  static const Color secondryColor = Color(0xFF5669FF);
  static const Color thirdColor = Color(0xFF1C1C1C);

  static const Color primaryDarkColor = Color(0xFF101127);
  static const Color secondryDarkColor = Color(0xFF5669FF);
  static const Color thirdDarkColor = Color(0xFFF4EBDC);

  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
      titleLarge: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
      titleLarge: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700),
    ),
  );
}
