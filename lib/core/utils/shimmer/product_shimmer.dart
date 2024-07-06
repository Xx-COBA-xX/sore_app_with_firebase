// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/layout/t_grid_layout.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    super.key,
    required this.itemCount,
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, index) => const SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TShimmerEffict(height: 150, width: 150),
            SizedBox(height: TSizes.spaceBtwItems),
            TShimmerEffict(height: 15, width: 130),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            TShimmerEffict(height: 15, width: 80),
          ],
        ),
      ),
    );
  }
}
