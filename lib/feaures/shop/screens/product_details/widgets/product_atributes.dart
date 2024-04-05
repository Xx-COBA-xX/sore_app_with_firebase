// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/chips/chose_chips.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_price_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_title_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../../core/utils/constants/colors.dart';

class ProductAtributes extends StatelessWidget {
  const ProductAtributes({
    Key? key,
    required this.isDark,
  }) : super(key: key);
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TRoundedContainer(
          backgroundColor: isDark ? AppColors.darkGrey : AppColors.lightGrey,
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
                    children: [
                      const Row(
                        children: [
                          TProducTitle(
                            title: "Price : ",
                            smallTitle: true,
                          ),
                          Text(
                            "\$25",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: TSizes.spaceBtwItems / 2,
                          ),
                          TProductPrice(
                            price: "20",
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
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),
              Text(
                "This in the Description of the product and it can go up to Max 4 lines",
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        TSectionHeading(
          title: "Color",
          textColor: isDark ? AppColors.white : AppColors.dark,
          showMore: false,
          padding: EdgeInsets.zero,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Wrap(
          spacing: 8,
          children: [
            TChoiceChip(
                text: "Green", selected: true, onSelected: (isSelect) {}),
            TChoiceChip(
                text: "Red", selected: false, onSelected: (isSelect) {}),
            TChoiceChip(
                text: "Blue", selected: false, onSelected: (isSelect) {}),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TSectionHeading(
          title: "Size",
          showMore: false,
          textColor: isDark ? AppColors.white : AppColors.dark,
          padding: EdgeInsets.zero,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Wrap(
          spacing: 8,
          children: [
            TChoiceChip(
                text: "EU 34", selected: true, onSelected: (isSelect) {}),
            TChoiceChip(
                text: "EU 36", selected: false, onSelected: (isSelect) {}),
            TChoiceChip(
                text: "EU 38", selected: false, onSelected: (isSelect) {}),
          ],
        )
      ],
    );
  }
}
