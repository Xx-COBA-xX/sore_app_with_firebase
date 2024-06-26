import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/custom_icon_button.dart';
import 'package:sore_app_with_firebase/core/utils/validators/validator.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_func.dart';
import '../../../controller/signup controller/signup_controller.dart';
import 'signup_agree_checkbox.dart';

class SignupScreenForm extends StatelessWidget {
  const SignupScreenForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = THelperFunctions.isDarkMode(context);

    return Form(
      key: controller.signUpKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.textValidator(value, "First Name"),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                    hintText: "First Name",
                    prefixIcon: Icon(Iconsax.user_copy),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.textValidator(value, "Last Name"),
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                    prefixIcon: Icon(Iconsax.user_copy),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            validator: (value) => TValidator.textValidator(value, "Username"),
            controller: controller.username,
            decoration: const InputDecoration(
              hintText: "Usrename",
              prefixIcon: Icon(Iconsax.user_edit_copy),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            validator: TValidator.validateEmail,
            controller: controller.email,
            decoration: const InputDecoration(
              hintText: "E-mail",
              prefixIcon: Icon(Iconsax.direct_copy),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            validator: TValidator.validatorPhoneNumber,
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              hintText: "Phone Number",
              prefixIcon: Icon(Iconsax.call_copy),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          Obx(
            () => TextFormField(
              obscureText: controller.showPassword.value,
              validator: TValidator.validatePassword,
              controller: controller.password,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check_copy),
                  suffixIcon: CustomIconButton(
                    icon: controller.showPassword.value
                        ? Iconsax.eye_slash_copy
                        : Iconsax.eye_copy,
                    onPressed: () {
                      controller.showPassword.value =
                          !controller.showPassword.value;
                    },
                  )),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SignupAgreeCheckBox(dark: dark),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async=> await controller.signUp(),
              child: const Text("Creage Account"),
            ),
          ),
        ],
      ),
    );
  }
}
