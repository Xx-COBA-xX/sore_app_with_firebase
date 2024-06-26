import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/user/user_controller.dart';

import '../../../../../core/common/widgets/custom/custom_icon_button.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/validators/validator.dart';

class ReAuthLoginScreen extends StatelessWidget {
  const ReAuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Re-Authentication login",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add real name to easy verifiction, this name will appear in several pages",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 1.5),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right_copy),
                          hintText: "Email",
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Obx(
                        () => TextFormField(
                          validator: TValidator.validatePassword,
                          controller: controller.password,
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(Iconsax.password_check_copy),
                            suffixIcon: CustomIconButton(
                              icon: controller.hidePassword.value
                                  ? Iconsax.eye_slash_copy
                                  : Iconsax.eye_copy,
                              onPressed: () {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              controller.reAuthenticationEmailAndPassword(),
                          child: const Text("Verify"),
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
