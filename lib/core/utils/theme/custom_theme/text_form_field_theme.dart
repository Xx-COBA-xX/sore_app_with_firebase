import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightTextFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.black),
    errorStyle: const TextStyle().copyWith(fontSize: 14,fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.black.withOpacity(0.8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.grey,width: 1),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.grey,width: 1),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.blue,width: 1),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red,width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.orange,width: 2),
    ),
  );
   static InputDecorationTheme darkTextFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.white),
    errorStyle: const TextStyle().copyWith(fontSize: 14,fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.white.withOpacity(0.8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.grey,width: 1),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.grey,width: 1),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.blue,width: 1),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red,width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.orange,width: 2),
    ),
  );

}
