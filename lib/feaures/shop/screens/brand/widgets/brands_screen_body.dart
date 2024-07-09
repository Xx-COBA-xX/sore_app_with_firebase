import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/brands/brands_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/brand/brands_products.dart';

import '../../../../../core/common/widgets/custom/brand/t_brand_card.dart';
import '../../../../../core/common/widgets/custom/layout/t_grid_layout.dart';

class AllBrandsScreenBody extends StatelessWidget {
  const AllBrandsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandsContorller.instance;
    final brands = controller.allBrands;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Brands",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
            mainAxisExtent: 70,
            itemCount: brands.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: TBrandCard(
                isNetworkImage: true,
                productNum: "${brands[index].productCount} Products",
                image: brands[index].imageUrl,
                title: brands[index].name,
                onPressed: () => Get.to(() => BrandProducts(
                      brand: brands[index],
                    )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
