// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/custom_search_bar.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/layout/t_grid_layout.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/brand/brands_screen.dart';

import '../../../../../core/common/widgets/custom/brand/t_brand_card.dart';
import '../../../../../core/common/widgets/custom/tab/t_tab_widget.dart';
import 'category_tab.dart';

class StoreScreenBody extends StatelessWidget {
  const StoreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 355,
              backgroundColor: isDark ? AppColors.black : AppColors.white,
              flexibleSpace: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const CustomSearchBar(
                      showBarckgound: false,
                      showBorder: true,
                      text: "Search in store",
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections / 2,
                    ),
                    TSectionHeading(
                      textColor: isDark ? AppColors.white : AppColors.black,
                      title: "Featured Brands",
                      showMore: true,
                      onPressed: () => Get.to(
                        () => const AllBrandsScreen(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 300),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 1.5,
                    ),
                    TGridLayout(
                      mainAxisExtent: 70,
                      itemCount: 4,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: const TBrandCard(
                          image: TImages.categoriesIcon1,
                          title: "Nike",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: const TTabBar(
                tabs: [
                  Tab(
                    child: Text("Featuerd"),
                  ),
                  Tab(
                    child: Text("Clothes"),
                  ),
                  Tab(
                    child: Text("Shoose"),
                  ),
                  Tab(
                    child: Text("Electrc"),
                  ),
                  Tab(
                    child: Text("Sport"),
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(children: [
          TCategoryTab(isDark: isDark),
          TCategoryTab(isDark: isDark),
          TCategoryTab(isDark: isDark),
          TCategoryTab(isDark: isDark),
          TCategoryTab(isDark: isDark),
        ]),
      ),
    );
  }
}
