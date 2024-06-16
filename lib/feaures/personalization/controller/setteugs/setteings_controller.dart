// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/network/network_manager.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/login/login_screen.dart';

class SetteingsController extends GetxController {
  static SetteingsController get instance => Get.find();

  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  Future<void> signOut() async {
    try {
      final isConncted = await NetworkManager.instance.isConnected();

      //? check the {INTERNET} connection
      if (!isConncted) {
        TFullScreenLoader.stopLoading();

        return;
      }

      final authenticationRepository = AuthenticationRepository.instance;

      TLoaders.successSnackBar(
          title: "Successfully Log out",
          message:
              "Your account has been successfully logged out. You can log in again.");

      // Navigator.of(Get.overlayContext!).push(MaterialPageRoute(
      //   builder: (context) => const VerifyEmailScreen(),
      // ));
      await authenticationRepository.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
