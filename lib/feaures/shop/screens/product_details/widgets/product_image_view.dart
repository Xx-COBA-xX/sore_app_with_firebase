import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/t_circal_icon.dart';
import '../../../../../core/common/widgets/custom/curved_edge/curved_edge_widget.dart';
import '../../../../../core/common/widgets/images/container_image.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'product_image_slider.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: isDark ? AppColors.darkerGrey : AppColors.lightGrey,
        child: Stack(
          children: [
            const SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.only(
                    left: TSizes.productImageRadius * 2,
                    right: TSizes.productImageRadius * 2,
                    bottom: TSizes.productImageRadius * 2),
                child: Center(
                    child: TRoundedImage(
                  imageUrl: TImages.shrit,
                )),
              ),
            ),
            //! product image slider
            ProductImageSlider(isDark: isDark),
            TAppBar(
              actions: [
                TCircelarIcon(
                  isDark: isDark,
                  iconColor: Colors.red,
                  onPressed: () {},
                  icon: Iconsax.heart,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
