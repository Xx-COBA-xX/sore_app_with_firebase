// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../core/utils/helpers/helper_func.dart';
import 'widgets/product_image_view.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/product_raiting_and_share.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? Product Image Viwe
          ProductImageView(isDark: isDark),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductRaitingAndShare(),
                ProductMetaData(isDark: isDark)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
