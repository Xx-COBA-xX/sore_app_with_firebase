import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/login%20signup%20widgets/divider_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/login%20signup%20widgets/social_btn.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import 'signup_screen_form.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's create your an account",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // Form
            const SignupScreenForm(),
            
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TDividerWidget(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const TSocialMediaButton()
          ],
        ),
      ),
    );
  }
}
