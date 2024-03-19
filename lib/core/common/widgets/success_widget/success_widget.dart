import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/login/login_screen.dart';

import '../../../../core/utils/helpers/helper_func.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              Image.asset(
                width: THelperFunctions.screenWidth() * 0.6,
                TImages.successImage,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                "Your Account Successfully Created!",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "Welcome to Your Uitimate Shopping Destination. You can now enjoy shopping with us and get the best deals and offers.",
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
                    const LoginScreen(),
                  ),
                  child: const Text("Contiune"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
