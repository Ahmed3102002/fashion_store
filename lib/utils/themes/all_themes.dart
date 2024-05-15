import 'package:fashion_store/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static get lightTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.darkGreyClr,
        elevation: 0,
        titleTextStyle:
            GoogleFonts.prata(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      cardColor: AppColors.darkGreyClr,
    );
  }

  static get darkTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkGreyClr,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkGreyClr,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle:
            GoogleFonts.prata(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      cardColor: Colors.white,
    );
  }
}
