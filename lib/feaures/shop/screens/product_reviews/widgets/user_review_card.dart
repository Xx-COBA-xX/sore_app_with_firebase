import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/rounded_container.dart';
import '../../../../../core/common/widgets/custom/custom_icon_button.dart';
import '../../../../../core/common/widgets/custom/product/reating_bar_indicator.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images_string.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_func.dart';

class UserReivewCard extends StatelessWidget {
  const UserReivewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage(TImages.avatar),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(
                  "Jhon Doe",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            CustomIconButton(
              onPressed: () {},
              icon: Icons.more_vert,
              color: THelperFunctions.isDarkMode(context)
                  ? AppColors.white
                  : AppColors.dark,
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            const ReatingBarIndicator(
              rating: 4,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "01 Nov, 2023",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(
          "Sit back, relax, and enjoy seamless streaming of your favorite content. From blockbuster movies to chart-topping albums, ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TRoundedContainer(
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "T's Store",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "02 Nov, 2023",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ReadMoreText(
                "Sit back, relax, and enjoy seamless streaming of your favorite content. From blockbuster movies to chart-topping albums, you can watch the latest versions of the latest ",
                style: Theme.of(context).textTheme.bodyMedium,
                trimLines: 2,
                trimCollapsedText: "Show more",
                trimExpandedText: "Show less",
                trimMode: TrimMode.Line,
                moreStyle: const TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w800),
                lessStyle: const TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
