import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/constants/sizes.dart';


class SignupScreenForm extends StatelessWidget {
  const SignupScreenForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
            decoration: const InputDecoration(
              hintText: "Usrename",
              prefixIcon: Icon(Iconsax.user_edit_copy),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "E-mail",
              prefixIcon: Icon(Iconsax.direct_copy),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Phone Number",
              prefixIcon: Icon(Iconsax.call_copy),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Iconsax.password_check_copy),
              suffixIcon: Icon(Iconsax.eye_slash_copy),
            ),
          ),
        ],
      ),
    );
  }
}

