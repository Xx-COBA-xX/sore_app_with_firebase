import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utils.dart';
import '../../../controller/onboarding/onboarding_controller.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(context) - 10,
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: OnBoardingController.instance.skip,
        child: Row(
          children: [
            Text(
              "Skip",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Iconsax.arrow_right_1_copy,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
