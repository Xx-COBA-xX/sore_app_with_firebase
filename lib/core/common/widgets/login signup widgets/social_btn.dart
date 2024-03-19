import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';

class TSocialMediaButton extends StatelessWidget {
  const TSocialMediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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


