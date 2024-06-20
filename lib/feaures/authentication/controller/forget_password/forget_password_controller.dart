

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/network/network_manager.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/passwrod_configration/reset_password.dart';

import '../../../../core/utils/constants/images_string.dart';
import '../../../../core/utils/popups/full_screen_loadder.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController get instance => Get.find();

  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();

  void sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "Send Email..", TImages.loaderAnimation);
      //! check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //* viladitor
      if (!forgetFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email: email.text.trim());
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: "Successfully send email",
          message: "Email link was send to reset password");

      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message:
              "There some thing was worng in send password reset email , please try again");
    }
  }

  void resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "Send Email..", TImages.loaderAnimation);
      //! check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email: email);
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: "Successfully send email",
          message: "Email link was send to reset password");
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message:
              "There some thing was worng in send password reset email , please try again");
    }
  }
}
