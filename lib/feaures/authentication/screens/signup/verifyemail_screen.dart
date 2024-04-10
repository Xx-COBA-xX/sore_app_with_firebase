import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/success_widget/success_widget.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/login/login_screen.dart';

import '../../../../core/utils/helpers/helper_func.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
                "Verify your email",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "coba2003@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "congaratulations! You have successfully created your account. Please verify your email to continue.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    SuccessScreen(
                      onPressed: () => Get.to(
                        const LoginScreen(),
                      ),
                      title: "Your Account Successfully Created!",
                      subTitle:
                          "Welcome to Your Uitimate Shopping Destination. You can now enjoy shopping with us and get the best deals and offers.",
                    ),
                  ),
                  child: const Text("Contiune"),
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
