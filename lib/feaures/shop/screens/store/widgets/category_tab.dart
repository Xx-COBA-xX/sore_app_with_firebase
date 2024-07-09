import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/product_shimmer.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/brands/brands_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/sub_categorie/sub_categorie_screen.dart';

import '../../../../../core/common/widgets/custom/brand/t_product_brand_card.dart';
import '../../../../../core/common/widgets/custom/layout/t_grid_layout.dart';
import '../../../../../core/common/widgets/custom/product/product_card_viertical.dart';
import '../../../../../core/common/widgets/custom/section_heading.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images_string.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/product/product_controller.dart';
import '../../../models/categories/categories_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.isDark,
    required this.categories,
  });

  final bool isDark;
  final CategoriesModel categories;
  @override
  Widget build(BuildContext context) {
    final brandsController = BrandsContorller.instance;
    final controller = ProductController.instance;
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            return ListView.separated(
              itemCount: brandsController.featuredBrands.length-2,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              itemBuilder: (context, index) => TProductsBrandCard(
                isNetworkImage: true,
                brandImage: brandsController.featuredBrands[index].imageUrl,
                brandProuductItems: "${brandsController.featuredBrands[index].productCount} Products" ,
                brandTitle: brandsController.featuredBrands[index].name,
                productsImages: const [
                  TImages.product1,
                  TImages.product1,
                  TImages.product1,
                ],
              ),
            );
          }),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Column(
            children: [
              TSectionHeading(
                textColor: isDark ? AppColors.white : AppColors.black,
                title: "Maghy Like",
                showMore: true,
                onPressed: () => Get.to(
                  () => const SubCategorieScreen(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 300),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const ProductShimmer(itemCount: 4);
                }
                if (controller.products.isEmpty) {
                  return Center(
                    child: Text(
                      "No products found",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  );
                }
                return TGridLayout(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) => TProductCardVertical(
                    product: controller.products[index],
                  ),
                );
              }),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
