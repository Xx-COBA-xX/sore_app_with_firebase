import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/categiories_shimmer.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/categories/categories_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/sub_categorie/sub_categorie_screen.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images_string.dart';
import '../../../../../core/utils/constants/sizes.dart';

class CustomPopularCategoriesWidget extends StatelessWidget {
  const CustomPopularCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesContorller());

    return Obx(() {
      if (controller.isLoading.value) return const TCategoiresShimmer();
      if (controller.allCategories.isEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace,
          ),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return Column(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Get.to(() => const SubCategorieScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 300)),
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          TImages.categoriesIcon1,
                          fit: BoxFit.cover,
                          color: AppColors.black,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: 55,
                  child: Text(
                    controller.allCategories[index].name,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: AppColors.white,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              width: TSizes.spaceBtwItems,
            );
          },
          itemCount:controller.allCategories.length,
        ),
      );
    });
  }
}
