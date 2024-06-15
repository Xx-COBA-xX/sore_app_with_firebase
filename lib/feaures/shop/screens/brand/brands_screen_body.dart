import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../core/common/widgets/custom/brand/t_brand_card.dart';
import '../../../../core/common/widgets/custom/layout/t_grid_layout.dart';
import '../../../../core/utils/constants/images_string.dart';

class AllBrandsScreenBody extends StatelessWidget {
  const AllBrandsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 13,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: TBrandCard(
                image: TImages.categoriesIcon1,
                title: "Nike",
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    ));
  }
}
