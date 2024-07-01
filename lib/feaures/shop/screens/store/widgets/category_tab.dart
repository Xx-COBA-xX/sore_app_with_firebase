import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/sub_categorie/sub_categorie_screen.dart';

import '../../../../../core/common/widgets/custom/brand/t_product_brand_card.dart';
import '../../../../../core/common/widgets/custom/layout/t_grid_layout.dart';
import '../../../../../core/common/widgets/custom/product/product_card_viertical.dart';
import '../../../../../core/common/widgets/custom/section_heading.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images_string.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../models/categories/categories_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.isDark, required this.categories,
  });

  final bool isDark;
  final CategoriesModel categories;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const TProductsBrandCard(
          brandImage: TImages.categoriesIcon1,
          brandProuductItems: "234 Products",
          brandTitle: "Nike",
          productsImages: [
            TImages.product1,
            TImages.product1,
            TImages.product1,
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const TProductsBrandCard(
          brandImage: TImages.categoriesIcon1,
          brandProuductItems: "234 Products",
          brandTitle: "Nike",
          productsImages: [
            TImages.product1,
            TImages.product1,
            TImages.product1,
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TSectionHeading(
          textColor: isDark ? AppColors.white : AppColors.black,
          title: "Maghy Like",
          showMore: true,
          onPressed: () => Get.to(
            () => const SubCategorieScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 300),
          ),
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TGridLayout(
          itemCount: 4,
          itemBuilder: (context, index) => const TProductCardVertical(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
