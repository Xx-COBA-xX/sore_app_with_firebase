import 'package:flutter/cupertino.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/common/widgets/images/container_image.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../../core/common/widgets/custom/product/product_card_horizantial.dart';

class SubCategorieScreenBody extends StatelessWidget {
  const SubCategorieScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            const TSectionHeading(
              title: "Sports Shirts",
              showMore: true,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
                height: 120,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace),
                  itemBuilder: (context, index) {
                    return const ProductCardHorizantial();
                  },
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                ))
          ],
        ),
      ),
    );
  }
}
