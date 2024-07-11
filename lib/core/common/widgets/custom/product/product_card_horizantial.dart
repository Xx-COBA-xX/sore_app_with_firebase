// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_price_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_title_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/text/t_brand_title_text.dart';
import 'package:sore_app_with_firebase/core/common/widgets/images/container_image.dart';
import 'package:sore_app_with_firebase/core/utils/constants/enums.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../../../feaures/shop/controller/product/product_controller.dart';
import '../../../../../feaures/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../contianer_widget/rounded_container.dart';
import '../faivorat/faivorat_button_widget.dart';

class ProductCardHorizantial extends StatelessWidget {
  const ProductCardHorizantial({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final pricePercent =
        controller.calculateSalePercent(product.price, product.salePrice);
    return GestureDetector(
      onTap: () => Get.to(
          () => ProdcutDetails(
                productModel: product,
              ),
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
                    fit: BoxFit.cover,
                    isNetworkImage: true,
                    imageUrl: product.thumbnail,
                    color: dark ? AppColors.darkGrey : AppColors.lightContainer,
                  ),
                ),
                if (product.salePrice > 0)
                  Positioned(
                    top: 10,
                    left: 5,
                    child: TRoundedContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.xs, vertical: TSizes.xs),
                      backgroundColor: AppColors.secondary.withOpacity(.8),
                      reduis: TSizes.sm,
                      child: Text("-$pricePercent",
                          style: const TextStyle(color: AppColors.black)),
                    ),
                  ),
                Positioned(
                  top: 2,
                  right: -10,
                  child: TFavoriteButtonWidget(
                    productId: product.id,
                    dark: dark,
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
                  TProducTitle(
                    title: product.title,
                    smallTitle: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleText(
                    title: product.brand!.name,
                    textSizes: TextSizes.medium,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      TProductPrice(
                          price: controller.getProductsPrice(product)),
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
