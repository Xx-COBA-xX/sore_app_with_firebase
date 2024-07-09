// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/product_shimmer.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/popular_product/widgets/pupular_product_screen_body.dart';

import '../../../../../core/common/widgets/custom/brand/t_brand_card.dart';
import '../../../controller/product/product_controller.dart';
import '../../../models/brands/brands_model.dart';

class BrandProductsBody extends StatelessWidget {
  const BrandProductsBody({
    super.key,
    required this.brand,
  });
  final BrandsModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandCard(
              title: brand.name,
              image: brand.imageUrl,
              isNetworkImage: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FutureBuilder(
              future: controller.fetchBrandProducts(brandId: brand.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ProductShimmer(
                    itemCount: 4,
                  );
                }
                if (snapshot.hasError ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(child: Text("Error"));
                }
                final List<ProductModel> products =
                    snapshot.data as List<ProductModel>;
                return TSortbalProducts(products: products);
              },
            )
          ],
        ),
      ),
    );
  }
}
