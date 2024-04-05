import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/enums.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/product_details/product_details.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../style/product_card_shadow.dart';
import '../../images/container_image.dart';
import '../contianer_widget/rounded_container.dart';
import 'product_price_widget.dart';
import 'product_title_widget.dart';
import '../text/t_brand_title_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProdcutDetails(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 300)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.productShadowStyle],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? AppColors.darkGrey : AppColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  const TRoundedImage(
                    imageUrl: TImages.product1,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    child: TRoundedContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
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
                  ),
                  Positioned(
                    right: -16,
                    top: -16,
                    child: CupertinoButton(
                      onPressed: () {},
                      child: TRoundedContainer(
                        backgroundColor: dark
                            ? AppColors.black.withOpacity(0.9)
                            : AppColors.white.withOpacity(0.9),
                        padding: const EdgeInsets.all(TSizes.xs + 2),
                        reduis: 100,
                        child: const Center(
                          child: Icon(
                            Iconsax.heart,
                            size: 22,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.xs),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProducTitle(
                    title: "White Nike Ari Shose with white ",
                    smallTitle: true,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 3,
                  ),
                  TBrandTitleText(
                    title: "Nike",
                    iconColor: AppColors.primary,
                    maxLine: 1,
                    textSizes: TextSizes.large,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: TProductPrice(
                    price: "35.5",
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add_copy,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
