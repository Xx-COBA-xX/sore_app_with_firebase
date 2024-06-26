import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppColors.grey.withOpacity(0.5),
    labelStyle: const TextStyle(color: AppColors.black),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.all(12),
    checkmarkColor: AppColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColors.darkGrey,
    labelStyle: TextStyle(color: AppColors.white),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.all(12),
    checkmarkColor: AppColors.white,
  );
}
