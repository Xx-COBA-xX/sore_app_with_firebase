import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/t_circal_icon.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_price_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_title_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/text/t_brand_title_text.dart';
import 'package:sore_app_with_firebase/core/common/widgets/images/container_image.dart';
import 'package:sore_app_with_firebase/core/utils/constants/enums.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import '../../../../../feaures/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../contianer_widget/rounded_container.dart';

class ProductCardHorizantial extends StatelessWidget {
  const ProductCardHorizantial({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProdcutDetails(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 300)),
      child: Container(
        width: 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? AppColors.dark : AppColors.sfotGrey,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.shrit,
                    color: dark ? AppColors.darkGrey : AppColors.lightContainer,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  child: TRoundedContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.xs, vertical: TSizes.xs),
                    backgroundColor: AppColors.secondary.withOpacity(.8),
                    reduis: TSizes.sm,
                    child: const Text("-25%",
                        style: TextStyle(color: AppColors.black)),
                  ),
                ),
                Positioned(
                  top: 2,
                  right: -10,
                  child: TCircelarIcon(
                    isDark: dark,
                    icon: Iconsax.heart,
                    iconColor: AppColors.error,
                    backgroundColor: Colors.transparent,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: 176,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  const TProducTitle(
                    title: "Black Nike Sport Shirt with iadkrakj",
                    smallTitle: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  const TBrandTitleText(
                    title: "Nike",
                    textSizes: TextSizes.medium,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TProductPrice(price: "256"),
                      Container(
                        decoration: BoxDecoration(
                          color: dark ? AppColors.darkerGrey : AppColors.dark,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
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
            )
          ],
        ),
      ),
    );
  }
}
