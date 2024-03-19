import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/passwrod_configration/forget_password.dart';

import '../../../../../bottom_nav_bar.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../signup/signup_screen.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //? email field
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Iconsax.direct_right_copy),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),
            //? password field
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Iconsax.password_check_copy),
                suffixIcon: Icon(Iconsax.eye_slash_copy),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField / 2,
            ),
            //? remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //? remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(
                      "Remember Me ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                //? forgot password
                TextButton(
                  child: const Text(
                    "Forgot Password?",
                  ),
                  onPressed: () => Get.to(const ForgetPasswordScreen()),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(const BottomNavBar()),
                child: const Text(
                  "Login",
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // Outline button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(const SignupScreen()),
                child: const Text(
                  "Create an Account",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
