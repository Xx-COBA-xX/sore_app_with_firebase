import 'package:flutter/material.dart';

import '../product_title_widget.dart';
import '../../text/t_brand_title_text.dart';
import '../../../images/container_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';
class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          padding: const EdgeInsets.all(TSizes.xs),
          imageUrl: TImages.product1,
          height: 60,
          width: 60,
          color: isDark ? AppColors.darkerGrey : AppColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        // ignore: prefer_const_constructors
        Expanded(
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleText(title: "Nike"),
              const TProducTitle(
                maxLine: 1,
                title: "White Sport shoes",
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "color ",
                      style: Theme.of(context).textTheme.bodySmall
                    ),
                    TextSpan(
                      text: "White ",
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                    TextSpan(
                      text: "Size ",
                      style: Theme.of(context).textTheme.bodySmall
                    ),
                    TextSpan(
                      text: "UK 41",
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}
