import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TOutlineBottonTheme {
  TOutlineBottonTheme._();

  static OutlinedButtonThemeData lightOutlineBottonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: AppColors.black,
    side: const BorderSide(color: AppColors.grey),
    textStyle: const TextStyle(
        fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
  ));

  static OutlinedButtonThemeData darkOutlineBottonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: AppColors.white,
    side: const BorderSide(color: AppColors.grey),
    textStyle: const TextStyle(
        fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
  ));
}
