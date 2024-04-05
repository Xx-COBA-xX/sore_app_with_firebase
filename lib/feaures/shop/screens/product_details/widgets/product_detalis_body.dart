// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/custom_icon_button.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../../core/utils/helpers/helper_func.dart';
import 'product_atributes.dart';
import 'product_image_view.dart';
import 'product_meta_data.dart';
import 'product_raiting_and_share.dart';

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
                ProductMetaData(isDark: isDark),
                ProductAtributes(
                  isDark: isDark,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout"))),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TSectionHeading(
                  textColor: isDark ? AppColors.white : AppColors.dark,
                  title: "Description",
                  showMore: false,
                  padding: EdgeInsets.zero,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  "this is the description of  idaherhakdf akjd falkjdf alkdf jeljr alkjer some of the line in this product jadljfaerthe project and the project description is available ",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'less',
                  moreStyle: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TSectionHeading(
                      title: "Reviews",
                      textColor: isDark ? AppColors.white : AppColors.dark,
                      showMore: false,
                      padding: EdgeInsets.zero,
                    ),
                    CustomIconButton(
                      icon: Iconsax.arrow_right_3_copy,
                      size: 20,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
