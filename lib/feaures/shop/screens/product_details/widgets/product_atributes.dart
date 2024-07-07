// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/chips/chose_chips.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_price_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_title_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/product/variation_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../../../core/utils/constants/colors.dart';

class ProductAtributes extends StatelessWidget {
  const ProductAtributes({
    super.key,
    required this.product,
    required this.isDark,
  });
  final ProductModel product;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              backgroundColor: isDark ? AppColors.darkerGrey : AppColors.light,
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    children: [
                      TSectionHeading(
                        padding: EdgeInsets.zero,
                        title: "Variation",
                        textColor: isDark ? AppColors.white : AppColors.dark,
                        showMore: false,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProducTitle(
                                title: "Price : ",
                                smallTitle: true,
                              ),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  "\$${controller.selectedVariation.value.price}",
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(
                                width: TSizes.spaceBtwItems / 2,
                              ),
                              TProductPrice(
                                price: "${controller.getVariationPrice()}",
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const TProducTitle(
                                title: "Stock : ",
                                smallTitle: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Text(
                    "${controller.selectedVariation.value.description}",
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
          if (controller.selectedVariation.value.id.isNotEmpty)
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          Column(
            children: product.productAttributes!.map((attributes) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                      title: attributes.name!,
                      textColor: isDark ? AppColors.white : AppColors.dark,
                      showMore: false,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Obx(() => Wrap(
                        spacing: 8,
                        children: attributes.value!.map((value) {
                          final isSelect =
                              controller.selectedAttributes[attributes.name] ==
                                  value;
                          final available = controller
                              .getAttributesAvailabilityVariation(
                                  product.productVariations!, attributes.name!)
                              .contains(value);
                          return TChoiceChip(
                              text: value,
                              selected: isSelect,
                              onSelected: available
                                  ? (isSelect) {
                                      if (isSelect && available) {
                                        controller.onAttributeSelected(
                                            product, attributes.name!, value);
                                      }
                                    }
                                  : null);
                        }).toList())),
                  ]);
            }).toList(),
          ),
        ],
      );
    });
  }
}
