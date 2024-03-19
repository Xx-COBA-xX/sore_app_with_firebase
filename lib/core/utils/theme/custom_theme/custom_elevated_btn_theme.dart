import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TElevatedBtnTheme {
  TElevatedBtnTheme._();

  static ElevatedButtonThemeData lightElevatedBtnTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.blue,
      disabledBackgroundColor: AppColors.grey,
      disabledForegroundColor: AppColors.grey,
      side: const BorderSide(color: AppColors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static ElevatedButtonThemeData darkElevatedBtnTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.blue,
      disabledBackgroundColor: AppColors.grey,
      disabledForegroundColor: AppColors.grey,
      side: const BorderSide(color: AppColors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
