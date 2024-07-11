import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/layout/t_grid_layout.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_card_viertical.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/product/faivorat_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../../../core/utils/shimmer/product_shimmer.dart';

class WishlistScreenBody extends StatelessWidget {
  const WishlistScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Obx(() {
            return FutureBuilder(
                future: controller.fetchFavoriteProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const ProductShimmer(
                      itemCount: 4,
                    );
                  }
                  if (snapshot.hasError ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("No favorite products"),
                    );
                  }
                  final products = snapshot.data as List<ProductModel>;
                  return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) => TProductCardVertical(
                      product: products[index],
                    ),
                  );
                });
          }),
        ],
      ),
    );
  }
}
