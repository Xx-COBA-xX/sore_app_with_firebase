// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/common/widgets/images/container_image.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/t_horzantial_product_card.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/categories/categories_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/categories/categories_model.dart';

import '../../../../../core/common/widgets/custom/product/product_card_horizantial.dart';
import '../../popular_product/popular_product.dart';

class SubCategorieScreenBody extends StatelessWidget {
  const SubCategorieScreenBody({
    super.key,
    required this.category,
  });

  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoriesContorller.instance;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: TRoundedImage(
                imageUrl: TImages.ad3,
                width: double.infinity,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            FutureBuilder(
                future: controller.fetchSupCategories(categoryId: category.id),
                builder: (context, snapshot) {
                  const loader = THorizantalProductCardShimmer(
                    itemCount: 3,
                  );
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return loader;
                  }
                  if (snapshot.hasError ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  final supCategories = snapshot.data!;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => FutureBuilder(
                        future: controller.fetchSupCategoryProduct(
                            categoryId: supCategories[index].id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return loader;
                          }
                          if (snapshot.hasError ||
                              snapshot.data == null ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text("Error"),
                            );
                          }
                          final products = snapshot.data!;
                          return Column(
                            children: [
                              TSectionHeading(
                                title: supCategories[index].name,
                                showMore: true,
                                onPressed: () => Get.to(
                                  () => PopularProductScreen(
                                    title: supCategories[index].name,
                                    fetchMethod:
                                        controller.fetchSupCategoryProduct(
                                            categoryId:
                                                supCategories[index].id),
                                  ),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: TSizes.defaultSpace),
                                  itemBuilder: (context, index) {
                                    return ProductCardHorizantial(
                                      product: products[index],
                                    );
                                  },
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                          width: TSizes.spaceBtwItems),
                                ),
                              ),
                            ],
                          );
                        }),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: TSizes.spaceBtwItems),
                    itemCount: supCategories.length,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
