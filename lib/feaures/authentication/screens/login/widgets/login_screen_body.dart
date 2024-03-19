import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/login signup widgets/divider_widget.dart';
import '../../../../../core/common/widgets/login signup widgets/social_btn.dart';
import '../../../../../core/common/style/padding_with_app_bar_hight.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_func.dart';
import 'login_screen_form.dart';
import 'login_screen_head.dart';
class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: TStyle.paddingWithAppBarHight,
        child: Column(
          children: [
            TLoginHead(dark: dark),
            const TLoginForm(),

            // Divider
            TDividerWidget(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //? social media button

            const TSocialMediaButton()
          ],
        ),
      ),
    );
  }
}
