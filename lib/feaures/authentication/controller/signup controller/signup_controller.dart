// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/network/network_manager.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/signup/verifyemail_screen.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final privacyPolicy = false.obs;
  final showPassword = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();

  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "We are processing your information ...", TImages.loaderAnimation);
      final isConncted = await NetworkManager.instance.isConnected();

      //? check the {INTERNET} connection
      if (!isConncted) {
        TFullScreenLoader.stopLoading();

        return;
      }

      //* check the {INPUT VALIDATION} of the form
      if (!signUpKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      //! check the {PRIVACY POLICY} checkbox
      if (!privacyPolicy.value) {
        TLoaders.waringSnackBar(
            title: "Accept the privacy policy",
            message:
                "In order to create an account, you must to accept the privacy policy & Terms of Use");
        return;
      }
      final authenticationRepository = AuthenticationRepository.instance;

      final userCredential =
          await authenticationRepository.registerEmailAndPassword(
              email: email.text.trim(), password: password.text.trim());

      // final UserModel userModel = UserModel(
      //     firstName: firstName.text,
      //     lastName: lastName.text,
      //     email: email.text,
      //     phoneNumber: phoneNumber.text,
      //     username: username.text,
      //     profilePicture: "",
      //     uid: userCredential.user!.uid);

      // final UserRepository userRepository = Get.put(UserRepository());
      // await userRepository.saveUserRecord(userModel);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: "Congratulations",
          message:
              "Your account has been created, please verify your email address");

      // Navigator.of(Get.overlayContext!).push(MaterialPageRoute(
      //   builder: (context) => const VerifyEmailScreen(),
      // ));
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
