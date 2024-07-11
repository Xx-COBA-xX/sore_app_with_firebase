import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';

class THorizantalProductCardShimmer extends StatelessWidget {
  const THorizantalProductCardShimmer({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TShimmerEffict(height: 120, width: 120),
              SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TShimmerEffict(height: 20, width: 100),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TShimmerEffict(height: 20, width: 100),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TShimmerEffict(height: 30, width: 50),
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(width: TSizes.spaceBtwItems),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
      ),
    );
  }
}
