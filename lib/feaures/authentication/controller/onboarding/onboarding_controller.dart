import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sore_app_with_firebase/core/utils/constants/valribals.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  final Rx<int> currentPage = 0.obs;
  void updatePageIndecator(int index) => currentPage.value = index;

  void dotIndecatroCleck(int index) {
    currentPage.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void nextPage() async {
    if (currentPage.value == 2) {
      final SharedPreferences storage = await SharedPreferences.getInstance();

      storage.setBool(IS_FIRST_TIME, false);

      Get.offAll(() => const LoginScreen());
    } else {
      currentPage.value = currentPage.value + 1;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skip() {
    currentPage.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
