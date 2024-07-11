// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/brand/t_brand_card.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/brands/brands_model.dart';

import '../../../../../feaures/shop/screens/brand/brands_products.dart';
import '../../../../utils/constants/colors.dart';
import '../../images/container_image.dart';
import '../contianer_widget/rounded_container.dart';

class TProductsBrandCard extends StatelessWidget {
  const TProductsBrandCard({
    super.key,
    this.showBordnBorder = false,
    this.showProductBrandBorder = false,
    required this.productsImages,
    this.productBackgroundColor = AppColors.darkGrey,
    this.isNetworkImage = false,
    required this.brand,
  });
  final bool? showBordnBorder;
  final bool? showProductBrandBorder;
  final List<String> productsImages;
  final Color? productBackgroundColor;
  final bool isNetworkImage;
  final BrandsModel brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => BrandProducts(
          brand: brand,
        ),
      ),
      child: TRoundedContainer(
        showBorder: true,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandCard(
              isNetworkImage: isNetworkImage,
              title: brand.name,
              image: brand.imageUrl,
              showBorder: showBordnBorder,
              productNum: "${brand.productCount} Products",
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.spaceBtwItems,
                  right: TSizes.spaceBtwItems,
                  bottom: TSizes.spaceBtwItems),
              child: Row(
                  children: List.generate(productsImages.length, (index) {
                // ignore: prefer_const_constructors
                return Expanded(
                  child: TRoundedContainer(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    backgroundColor: productBackgroundColor!,
                    showBorder: false,
                    child: TRoundedImage(
                      fit: BoxFit.cover,
                      isNetworkImage: isNetworkImage,
                      imageUrl: productsImages[index],
                    ),
                  ),
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
