import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

class TLoaders {
  static successSnackBar({required String title, message = "", duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.white,
      backgroundColor: AppColors.primary,
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Iconsax.check_copy,
        color: AppColors.white,
      ),
    );
  }

  static waringSnackBar({required title, message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppColors.white,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2_copy,
        color: AppColors.white,
      ),
      
    );
  }

  static errorSnackBar({required title, message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppColors.white,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Icons.error_outline,
        color: AppColors.white,
      ),
      
    );
  }
}
