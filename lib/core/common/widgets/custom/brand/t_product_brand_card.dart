import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/brand/t_brand_card.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../images/container_image.dart';
import '../contianer_widget/rounded_container.dart';

class TProductsBrandCard extends StatelessWidget {
  const TProductsBrandCard(
      {super.key,
      required this.brandTitle,
      required this.brandProuductItems,
      required this.brandImage,
      this.showBordnBorder = false,
      this.showProductBrandBorder = false,
      this.productBackgroundColor = AppColors.darkGrey,
      required this.productsImages});
  final String brandTitle;
  final String brandProuductItems;
  final String brandImage;
  final bool? showBordnBorder;
  final bool? showProductBrandBorder;
  final List<String> productsImages;
  final Color? productBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        children: [
          TBrandCard(
            title: brandTitle,
            image: brandImage,
            showBorder: showBordnBorder,
            productNum: brandProuductItems,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.spaceBtwItems,
                right: TSizes.spaceBtwItems,
                bottom: TSizes.spaceBtwItems),
            child: Row(
                children: List.generate(3, (index) {
              // ignore: prefer_const_constructors
              return Expanded(
                child: TRoundedContainer(
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  backgroundColor: productBackgroundColor!,
                  showBorder: false,
                  child: TRoundedImage(
                    imageUrl: productsImages[index],
                  ),
                ),
              );
            })),
          ),
        ],
      ),
    );
  }
}
