import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_title_widget.dart';

import '../../../../../core/common/widgets/custom/text/t_brand_title_text.dart';
import '../../../../../core/common/widgets/images/t_circal_image.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/images_string.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'product_price.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProductPrice(),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        const TProducTitle(
          title: "Nike T-Shirt with player image",
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const TProducTitle(
              title: "Status :",
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              "In Stack",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            TCircalrImage(
              isDark: isDark,
              image: TImages.categoriesIcon1,
              height: 35,
              width: 35,
              imageColor: isDark ? AppColors.white : AppColors.black,
            ),
            const TBrandTitleText(
              title: "Nike",
              textSizes: TextSizes.medium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
      ],
    );
  }
}
