import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class TAppTextTheme {
  TAppTextTheme._();

  static TextTheme lightTextTheme = 
TextTheme(
    headlineLarge: GoogleFonts.poppins().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.dark),
    headlineMedium:  GoogleFonts.poppins().copyWith(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.dark),
    headlineSmall: GoogleFonts.poppins().copyWith(
        fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.dark),
    titleLarge: GoogleFonts.poppins().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark),
    titleMedium: GoogleFonts.poppins().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark),
    titleSmall: GoogleFonts.poppins().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark),
    bodyLarge: GoogleFonts.poppins().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.dark),
    bodyMedium: GoogleFonts.poppins().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.dark),
    bodySmall: GoogleFonts.poppins().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black.withOpacity(0.5)),
    labelLarge: GoogleFonts.poppins().copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.dark),
    labelMedium: GoogleFonts.poppins().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black.withOpacity(0.5)),
  );


  static TextTheme darkTextTheme = 
    TextTheme(
      headlineLarge: GoogleFonts.poppins().copyWith(
          fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.white),
      headlineMedium: GoogleFonts.poppins().copyWith(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
      headlineSmall: GoogleFonts.poppins().copyWith(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
      titleLarge: GoogleFonts.poppins().copyWith(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
      titleMedium: GoogleFonts.poppins().copyWith(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
      titleSmall: GoogleFonts.poppins().copyWith(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
      bodyLarge: GoogleFonts.poppins().copyWith(
          fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white),
      bodyMedium: GoogleFonts.poppins().copyWith(
          fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white),
      bodySmall: GoogleFonts.poppins().copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.white.withOpacity(0.5)),
      labelLarge: GoogleFonts.poppins().copyWith(
          fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
      labelMedium: GoogleFonts.poppins().copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.white.withOpacity(0.5)),
    );
}

