import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/t_circal_icon.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

class ProductButtomNavBar extends StatelessWidget {
  const ProductButtomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      height: 65,
      backgroundColor: isDark ? AppColors.darkerGrey : AppColors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:TSizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircelarIcon(
                  height: 35,
                  width: 35,
                  isDark: isDark,
                  iconColor: AppColors.white,
                  icon: Iconsax.minus_copy,
                  iconSize: 28,
                  backgroundColor: AppColors.darkGrey,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
                Text(
                  "2",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                TCircelarIcon(
                  height: 35,
                  width: 35,
                  isDark: isDark,
                  iconColor: AppColors.white,
                  icon: Iconsax.add_copy,
                  iconSize: 28,
                  backgroundColor: AppColors.black,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width/3,
              child: CupertinoButton(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(15),
                padding: EdgeInsets.zero,
                onPressed: () {},
                child:  Text(
                  "Add To Cart",
                  style: Theme.of(context).textTheme.titleMedium!.apply(color: AppColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
