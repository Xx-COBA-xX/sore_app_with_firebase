import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/user/user_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/cart/cart_screen.dart';

import '../../../../../core/common/widgets/custom/costom_app_bar.dart';
import '../../../../../core/common/widgets/custom/custom_cart_count_icon.dart';
import '../../../../../core/utils/constants/colors.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good day for shopping",
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: AppColors.grey,
                ),
          ),
          Obx(() {
            if (controller.profileName.value) {
              return const TShimmerEffict(height: 15, width: 80,radius: 100,);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: AppColors.white,
                    ),
              );
            }
          }),
        ],
      ),
      actions: [
        TCartCountIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          color: AppColors.white,
        )
      ],
    );
  }
}
