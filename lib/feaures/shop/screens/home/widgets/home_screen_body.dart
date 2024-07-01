// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/layout/t_grid_layout.dart';

import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/popular_product/popular_product.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/custom_search_bar.dart';
import '../../../../../core/common/widgets/custom/contianer_widget/primery_headlng_container.dart';
import '../../../../../core/common/widgets/custom/product/product_card_viertical.dart';
import '../../../../../core/common/widgets/custom/section_heading.dart';
import '../../../controller/ads/ads_controller.dart';
import 'ads_slider_images.dart';
import 'custom_popular_categories_widget.dart';
import 'home_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          const ContainerWithCurvedEdge(
            child: Column(
              children: [
                THomeAppBar(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                CustomSearchBar(
                  text: "Search in Store",
                  showBarckgound: true,
                  showBorder: true,
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TSectionHeading(
                  title: "Popular Categories",
                  showMore: false,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                CustomPopularCategoriesWidget(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          ),
          const AdsSliderImages(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          TSectionHeading(
            btnText: "View All",
            title: 'Popular Products',
            showMore: true,
            onPressed: () => Get.to(() => const PopularProductScreen(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 300)),
          ),
          TGridLayout(
            itemBuilder: (context, index) => const TProductCardVertical(),
            itemCount: 4,
          )
        ],
      ),
    );
  }
}
