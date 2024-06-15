import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/core/utils/validators/validator.dart';
import 'package:sore_app_with_firebase/feaures/authentication/controller/login%20controller/login_controller.dart';

import '../../../../../core/common/widgets/custom/custom_icon_button.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../signup/signup_screen.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //? email field
            TextFormField(
              validator: TValidator.validateEmail,
              controller: controller.email,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Iconsax.direct_right_copy),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),
            //? password field
            Obx(
              ()=> TextFormField(
                validator: TValidator.validatePassword,
                controller: controller.password,
                obscureText: controller.showPassword.value,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check_copy),
                  suffixIcon:CustomIconButton(
                      icon: controller.showPassword.value
                          ? Iconsax.eye_slash_copy
                          : Iconsax.eye_copy,
                      onPressed: () {
                        controller.showPassword.value =
                            !controller.showPassword.value;
                      },
                    ),
                  ),
                
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
                    Obx(
                      () => Checkbox(
                        value: controller.remmberMe.value,
                        onChanged: (value) {
                          controller.remmberMe.value =
                              !controller.remmberMe.value;
                        },
                      ),
                    ),
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
                  // onPressed: () => Get.to(const ForgetPasswordScreen()),
                  onPressed: () => Get.to(()=>TFullScreenLoader.opneLoadeingDialog("hhaerhd", TImages.loaderAnimation),)
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
                onPressed: () => controller.login(),
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
                onPressed: () => Get.to(()=> const SignupScreen()),
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
