import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/passwrod_configration/reset_password.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forget Password",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                "Don't warry sometimes people forget too, enter your email and we will send you a password reset link.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 1.5),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right_copy),
                      hintText: "E-Mail",
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>Get.to(const ResetPasswordScreen()),
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
