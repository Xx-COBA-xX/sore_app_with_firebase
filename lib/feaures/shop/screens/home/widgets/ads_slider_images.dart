import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/ads/ads_controller.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/circaler_container.dart';
import '../../../../../core/common/widgets/images/container_image.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class AdsSliderImages extends StatelessWidget {
  const AdsSliderImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdsContorller());
    return Column(
      children: [
        Obx(
          () => CarouselSlider(
            items: controller.allAds
                .map((ad) => TRoundedImage(
                      imageUrl: ad.imageUrl,
                      fit: BoxFit.fill,
                      isNetworkImage: true,
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 170,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.onUpdateSlider(index);
              },
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.allAds.length; i++)
                  CircalerContainer(
                    height: 5,
                    width: controller.curentSilderIndex.value == i ? 25 : 16,
                    color: controller.curentSilderIndex.value == i
                        ? AppColors.primary
                        : AppColors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
