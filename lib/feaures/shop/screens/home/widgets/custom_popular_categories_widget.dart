import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images_string.dart';
import '../../../../../core/utils/constants/sizes.dart';

class CustomPopularCategoriesWidget extends StatelessWidget {
  const CustomPopularCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
                width: 50,
                child: Text(
                  "Shose Category",
                  style:
                      Theme.of(context).textTheme.bodyLarge!.apply(
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
        itemCount: 6,
      ),
    );
  }
}
