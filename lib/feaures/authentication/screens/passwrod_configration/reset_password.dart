import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/login/login_screen.dart';

import '../../../../core/utils/constants/images_string.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_func.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.clear,
            ),
            onPressed: () => Get.offAll(
              const LoginScreen(),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                width: THelperFunctions.screenWidth() * 0.6,
                TImages.verifyEmailImage,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                "Password Reset Email Sent",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "Your Account Security It Our Priority! We've Sent You a Secure Link to Safety Change Your Password and Keep Your Account Protected.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(const LoginScreen()),
                  child: const Text("Done"),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Resend Email"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
