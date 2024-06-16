import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/common/widgets/success_widget/success_widget.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance =>
      Get.find<VerifyEmailController>();

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimperToAuthRedirect();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: "Email Send",
          message: "Please check your email to verify your account");
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "sendEmailVerification", message: e.toString());
    }
  }

  setTimperToAuthRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.offAll(
          () => SuccessScreen(
            subTitle:
                "Welcome to Your Uitimate Shopping Destination. You can now enjoy shopping with us and get the best deals and offers.",
            title: "Your Account Successfully Created!",
            onPressed: () => AuthenticationRepository.instance.screenRidrect(),
          ),
        );
      }
    });
  }

  checkEmailVerifycationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.offAll(
        () => SuccessScreen(
          subTitle:
              "Welcome to Your Uitimate Shopping Destination. You can now enjoy shopping with us and get the best deals and offers.",
          title: "Your Account Successfully Created!",
          onPressed: () => AuthenticationRepository.instance.screenRidrect(),
        ),
      );
    }
  }
}
