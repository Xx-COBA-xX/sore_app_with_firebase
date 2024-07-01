import 'package:flutter/cupertino.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';

class TCategoiresShimmer extends StatelessWidget {
  const TCategoiresShimmer({super.key});

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
          return const Column(
            children: [
              TShimmerEffict(height: 55, width: 55, radius: 100),
              SizedBox(
                height: 3,
              ),
              TShimmerEffict(height: 15, width: 55)
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