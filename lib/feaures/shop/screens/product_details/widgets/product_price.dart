import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/rounded_container.dart';
import '../../../../../core/common/widgets/custom/product/product_price_widget.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.xs + 2),
          backgroundColor: AppColors.secondary.withOpacity(.8),
          reduis: TSizes.sm,
          child: Text(
            "-25%",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: AppColors.black),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          "\$250",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(decoration: TextDecoration.lineThrough),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        const TProductPrice(
          price: "175",
          isLarge: true,
        )
      ],
    );
  }
}
