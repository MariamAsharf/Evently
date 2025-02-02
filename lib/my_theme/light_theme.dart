import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/my_theme/theme.dart';

class LightTheme extends BaseLine {
  @override
  Color get backgroundColor => Color(0xFFF2FEFF);

  @override
  Color get primaryColor => Color(0xFF5669FF);

  @override
  Color get textColor => Color(0xFF1C1C1C);

  @override
  ThemeData get themeData => ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      focusColor: Color(0xFF7B7B7B),
      appBarTheme:
          AppBarTheme(centerTitle: true, backgroundColor: backgroundColor),
      textTheme: TextTheme(
        titleSmall: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w700, color: textColor),
        titleMedium: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w700, color: textColor),
        titleLarge: GoogleFonts.inter(
            fontSize: 24, fontWeight: FontWeight.w700, color: textColor),
        bodySmall: GoogleFonts.inter(
            fontSize: 12, fontWeight: FontWeight.w700, color: textColor),
        bodyMedium: GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.w700, color: textColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: backgroundColor,
        selectedItemColor: backgroundColor,
        backgroundColor: primaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(primaryColor),
          fixedSize: WidgetStatePropertyAll(
            Size(361, 56),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ));
}
