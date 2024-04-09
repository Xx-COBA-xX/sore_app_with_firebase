import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../contianer_widget/t_circal_icon.dart';
import '../product_price_widget.dart';
class TProdcutQuantityAndAddRemoveButton extends StatelessWidget {
  const TProdcutQuantityAndAddRemoveButton({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            TCircelarIcon(
              onPressed: () {},
              width: 30,
              height: 30,
              isDark: isDark,
              icon: Iconsax.minus_copy,
              backgroundColor: AppColors.darkerGrey,
              iconColor: AppColors.white,
            ),
            Text(
              "2",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            TCircelarIcon(
              onPressed: () {},
              width: 30,
              height: 30,
              isDark: isDark,
              icon: Iconsax.add_copy,
              backgroundColor: AppColors.primary,
              iconColor: AppColors.white,
            ),
          ],
        ),
        const TProductPrice(
          price: '254',
        )
      ],
    );
  }
}
