import 'package:flutter/widgets.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/layout/t_grid_layout.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_card_viertical.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

class WishlistScreenBody extends StatelessWidget {
  const WishlistScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
              itemCount: 6,
              itemBuilder: (context, index) => const TProductCardVertical())
        ],
      ),
    );
  }
}
