import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/authentication/controller/login%20controller/login_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';

class TSocialMediaButton extends StatelessWidget {
  const TSocialMediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              height: TSizes.iconMd,
              width: TSizes.iconMd,
              TImages.facebookLogo,
            ),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () async => await controller.signWithGoogle(),
            icon: SvgPicture.asset(
              height: TSizes.iconMd,
              width: TSizes.iconMd,
              TImages.googleLogo,
            ),
          ),
        )
      ],
    );
  }
}
