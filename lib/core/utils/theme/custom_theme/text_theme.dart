import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TAppTextTheme {
  TAppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.dark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.dark),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.dark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black.withOpacity(0.5)),
  );




  static TextTheme darkTextTheme = TextTheme(
    
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.white.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.white.withOpacity(0.5)),
  );
}
