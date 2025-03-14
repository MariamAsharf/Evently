import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/my_theme/theme.dart';

class DarkTheme extends BaseLine {
  @override
  Color get backgroundColor => Color(0xFF101127);

  @override
  Color get primaryColor => Color(0xFF5669FF);

  @override
  Color get textColor => Color(0xFFF4EBDC);

  @override
  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    hintColor: Color(0xFFF4EBDC),
    focusColor: primaryColor,
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
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          backgroundColor: backgroundColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: backgroundColor,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: BorderSide(width: 3, color: Colors.white),
          ),
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
        ),
      );
}
