import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/product_shimmer.dart';


import '../../../../../core/common/widgets/custom/layout/t_grid_layout.dart';
import '../../../../../core/common/widgets/custom/product/product_card_viertical.dart';
import '../../../../../core/common/widgets/custom/section_heading.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../controller/product/product_controller.dart';
import '../../../models/categories/categories_model.dart';
import 'category_brand.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.isDark,
    required this.category,
  });

  final bool isDark;
  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        CagegoryBrand(
          category: category,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        FutureBuilder(
            future: controller.fetchCategoryProducts(
                categoryId: category.id, limit: 4),
            builder: (context, snapshot) {
              const loader = ProductShimmer(itemCount: 4);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loader;
              }
              if (snapshot.hasError ||
                  snapshot.data == null ||
                  snapshot.data!.isEmpty) {
                return const Center(child: Text('Error'));
              }

              final products = snapshot.data!;
              return Column(
                children: [
                  TSectionHeading(
                    textColor: isDark ? AppColors.white : AppColors.black,
                    title: "Maghy Like",
                    showMore: true,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) => TProductCardVertical(
                      product: products[index],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ],
              );
            }),
      ],
    );
  }
}
