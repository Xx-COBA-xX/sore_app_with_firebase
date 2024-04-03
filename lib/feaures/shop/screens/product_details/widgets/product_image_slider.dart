import 'package:flutter/cupertino.dart';
import 'package:sore_app_with_firebase/core/common/widgets/images/container_image.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/rounded_container.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 30,
      child: SizedBox(
        height: 65,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: TRoundedContainer(
                width: 65,
                showBorder: true,
                backgroundColor: isDark ? AppColors.dark : AppColors.white,
                borderColor: AppColors.primary,
                reduis: 12,
                child: const TRoundedImage(
                  imageUrl: TImages.shrit,
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
            width: TSizes.spaceBtwItems / 1.5,
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}
