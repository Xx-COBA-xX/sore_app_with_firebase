import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

class TShadowStyle {
  static final BoxShadow productShadowStyle = BoxShadow(
    color: AppColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
