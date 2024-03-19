import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utils.dart';
import '../../../../../core/utils/helpers/helper_func.dart';
import '../../../controller/onboarding/onboarding_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(context),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: dark ? AppColors.primary : AppColors.dark,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: OnBoardingController.instance.nextPage,
        child: const Icon(
          Iconsax.arrow_right_3_copy,
        ),
      ),
    );
  }
}
