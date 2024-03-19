import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_theme/app_bar_theme.dart';
import 'custom_theme/bottom_shet_theme.dart';
import 'custom_theme/check_box_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/custom_elevated_btn_theme.dart';
import 'custom_theme/outline_botton_theme.dart';
import 'custom_theme/text_form_field_theme.dart';
import 'custom_theme/text_theme.dart';

class TAppThemeData {
  TAppThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    textTheme: TAppTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedBtnTheme.lightElevatedBtnTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlineBottonTheme.lightOutlineBottonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightTextFormFieldTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.black,
    brightness: Brightness.dark,
    primaryColor: AppColors.blue,
    textTheme: TAppTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedBtnTheme.darkElevatedBtnTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlineBottonTheme.darkOutlineBottonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkTextFormFieldTheme,
  );
}
