import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/curved_edge/curved_edge_widget.dart';
import 'package:sore_app_with_firebase/core/common/widgets/images/container_image.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import 'widgets/product_image_slider.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          TCurvedEdgesWidget(
            child: Container(
              color: isDark ? AppColors.dark : AppColors.light,
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

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

