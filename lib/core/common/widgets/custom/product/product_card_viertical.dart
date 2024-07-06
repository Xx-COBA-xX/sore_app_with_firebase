// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/utils/constants/enums.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/product/product_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/product_details/product_details.dart';

import '../../../../../feaures/shop/models/prodcut/pruduct_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../style/product_card_shadow.dart';
import '../../images/container_image.dart';
import '../contianer_widget/rounded_container.dart';
import '../text/t_brand_title_text.dart';
import 'product_price_widget.dart';
import 'product_title_widget.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final pricePercent =
        controller.calculateSalePercent(product.price, product.salePrice);

    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(
          () => ProdcutDetails(
                productModel: product,
                
              ),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 300)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.productShadowStyle],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? AppColors.darkerGrey : AppColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 150,
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                    imageUrl: product.thumbnail,
                    // imageUrl: TImages.product1,
                    isNetworkImage: true,
                    fit: BoxFit.contain,
                  ),
                  if (product.salePrice > 0)
                    Positioned(
                      top: 7,
                      left: 5,
                      child: TRoundedContainer(
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        backgroundColor: AppColors.secondary.withOpacity(.8),
                        reduis: TSizes.sm,
                        child: Text(
                          "-$pricePercent%",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: AppColors.black),
                        ),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
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
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProducTitle(
                    maxLine: 2,
                    title: product.title,
                    smallTitle: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 3,
                  ),
                  TBrandTitleText(
                    title: product.brand!.name,
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
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm - 2),
                          child: Text(
                            "\$${(product.price).toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: TSizes.sm),
                        child: TProductPrice(
                          price: controller.getProductsPrice(product),
                        ),
                      ),
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        const SizedBox(
                          height: TSizes.xs,
                        )
                    ],
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
