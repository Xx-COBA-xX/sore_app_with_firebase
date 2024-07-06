// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:sore_app_with_firebase/core/common/widgets/images/container_image.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/product/image_controller.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/rounded_container.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.isDark,
    required this.images,
    required this.controller,
  });

  final bool isDark;
  final List<String> images;
  final ImageController controller;

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
              onPressed: () => controller.selectImage.value = images[index],
              padding: EdgeInsets.zero,
              child: Obx(
                () => TRoundedContainer(
                    width: 65,
                    showBorder: controller.selectImage.value == images[index],
                    backgroundColor: isDark ? AppColors.dark : AppColors.white,
                    borderColor: AppColors.primary,
                    reduis: 12,
                    child: TRoundedImage(
                      imageUrl: images[index],
                      isNetworkImage: true,
                      fit: BoxFit.cover,
                    )),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
            width: TSizes.spaceBtwItems / 1.5,
          ),
          itemCount: images.length,
        ),
      ),
    );
  }
}
