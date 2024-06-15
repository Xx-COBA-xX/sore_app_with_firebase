import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';

import '../../../../core/utils/network/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => LoginController();

  final remmberMe = false.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final showPassword = true.obs;

  Future<void> login() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "We are processing your information", TImages.loaderAnimation);

      final isConncted = await NetworkManager.instance.isConnected();

      /// check the internet connection
      if (!isConncted) return;

      /// check input validation
      if (!loginKey.currentState!.validate()) return;

      final AuthenticationRepository authenticationRepository =
          AuthenticationRepository();
      authenticationRepository.loginEmailAndPassword(
          email: email.text, password: password.text);
      Get.offAll(() => const BottomAppBar());
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
