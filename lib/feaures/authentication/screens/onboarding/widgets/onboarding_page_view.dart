import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_func.dart';
import '../../../controller/onboarding/onboarding_controller.dart';
import '../../../models/onboarding_models/onboarding_models.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.onBoardingModels,
  });
  final List<OnBoardingModels> onBoardingModels;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return PageView.builder(
      itemCount: 3,
      controller: controller.pageController,
      onPageChanged: controller.updatePageIndecator,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              onBoardingModels[index].image,
              width: THelperFunctions.screenWidth() * .8,
              height: THelperFunctions.screenHeight() * .6,
            ),
            Text(
              onBoardingModels[index].title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Text(
                onBoardingModels[index].subTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
