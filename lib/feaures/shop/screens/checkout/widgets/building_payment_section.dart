import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/rounded_container.dart';
import '../../../../../core/common/widgets/custom/section_heading.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images_string.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_func.dart';

class TBuildingPaymentSection extends StatelessWidget {
  const TBuildingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          onPressed: () {},
          title: "Payment Method",
          showMore: true,
          btnText: "Change",
          padding: EdgeInsets.zero,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems/2,
        ),
        Row(
          children: [
            TRoundedContainer(
              width: 40,
              height: 40,
              backgroundColor: isDark ? AppColors.dark : AppColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: Image.asset(
                TImages.paypal,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              "Paypal",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        )
      ],
    );
  }
}
