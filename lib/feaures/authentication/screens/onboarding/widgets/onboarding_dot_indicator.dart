import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/authentication/controller/onboarding/onboarding_controller.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utils.dart';

class PageDotIndicator extends StatelessWidget {
  const PageDotIndicator({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(context) + 16,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotIndecatroCleck,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? AppColors.primary : AppColors.dark,
            dotHeight: 6,
            dotWidth: 12),
      ),
    );
  }
}
