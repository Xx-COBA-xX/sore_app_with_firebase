import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/valribals.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/user/user_controller.dart';

import '../../../../core/utils/network/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => LoginController();

  final remmberMe = false.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final showPassword = true.obs;
  late SharedPreferences localStrorage;
  @override
  onInit() async {
    super.onInit();
    localStrorage = await SharedPreferences.getInstance();
    email.text = localStrorage.getString(EMAIL_STORAGE) ?? "";
    password.text = localStrorage.getString(PASSWORD_STORAGE) ?? "";
  }

  Future<void> signInEamilWithPassword() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "We are processing your information", TImages.loaderAnimation);

      final isConncted = await NetworkManager.instance.isConnected();

      /// check the internet connection
      if (!isConncted) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// check input validation
      if (!loginKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (remmberMe.value) {
        localStrorage.setString(EMAIL_STORAGE, email.text);
        localStrorage.setString(PASSWORD_STORAGE, password.text);
      }

      await AuthenticationRepository.instance.loginEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRidrect();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// [GOOGLE AUTHUNTCTION]

  Future<void> signWithGoogle() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "Loading...", TImages.loaderAnimation);

      final isConncted = await NetworkManager.instance.isConnected();

      /// check the internet connection
      if (!isConncted) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final UserCredential userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      /// Save User Informaiton
      final UserController userController = Get.put(UserController());
      userController.saveRecord(userCredential);

      TFullScreenLoader.stopLoading();

      

      AuthenticationRepository.instance.screenRidrect();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
