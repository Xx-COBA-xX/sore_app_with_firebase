// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/boxes_shimmer.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/listtile_shimmer.dart';

import 'package:sore_app_with_firebase/feaures/shop/controller/brands/brands_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/categories/categories_model.dart';

import '../../../../../core/common/widgets/custom/brand/t_product_brand_card.dart';

class CagegoryBrand extends StatelessWidget {
  const CagegoryBrand({
    super.key,
    required this.category,
  });

  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandsContorller.instance;
    // final controller = ProductController.instance;

    return FutureBuilder(
      future: controller.fetchBrandForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        );

        if (snapshot.connectionState == ConnectionState.waiting) return loader;
        if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) return const Center(child: Text('Error'));

        final brands = snapshot.data!;
        return ListView.separated(
          itemCount: brands.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final brand = brands[index];
            return FutureBuilder(
                future: controller.fetchBrandForProduct(
                    brandId: brand.id!, limit: 3),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return loader; 
                  }
                  if (snapshot.hasError ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const Center(child: Text('Error naner '));
                  }

                  final products = snapshot.data!;
                  return TProductsBrandCard(
                    brand: brand,
                    isNetworkImage: true,
                    productsImages: products.map((e) => e.thumbnail).toList(),
                  );
                });
          },
        );
      },
    );
  }
}
