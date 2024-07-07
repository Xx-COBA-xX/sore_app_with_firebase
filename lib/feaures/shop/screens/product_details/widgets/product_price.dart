// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/constants/enums.dart';

import 'package:sore_app_with_firebase/feaures/shop/controller/product/product_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/rounded_container.dart';
import '../../../../../core/common/widgets/custom/product/product_price_widget.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Row(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.xs + 2),
          backgroundColor: AppColors.secondary.withOpacity(.8),
          reduis: TSizes.sm,
          child: Text(
            "-${controller.calculateSalePercent(product.price, product.salePrice)}",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: AppColors.black),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        if (product.productType == ProductType.single.toString() &&
            product.salePrice > 0)
          Text(
            "\$${product.price.toString()}",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(decoration: TextDecoration.lineThrough),
          ),
        if (product.productType == ProductType.single.toString() &&
            product.salePrice > 0)
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
        TProductPrice(
          price: "${controller.getProductsPrice(product)}",
          isLarge: true,
        )
      ],
    );
  }
}
