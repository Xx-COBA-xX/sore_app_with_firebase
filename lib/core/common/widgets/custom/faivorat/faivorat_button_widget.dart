// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../feaures/shop/controller/product/faivorat_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../contianer_widget/t_circal_icon.dart';

class TFavoriteButtonWidget extends StatelessWidget {
  const TFavoriteButtonWidget({
    super.key,
    required this.dark,
    required this.productId,
  });

  final bool dark;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(() {
      return TCircelarIcon(
        onPressed: () => controller.toggleFavorite(productId),
        isDark: dark,
        icon: controller.isFavorite(productId)
            ? Iconsax.heart
            : Iconsax.heart_copy,
        iconColor: controller.isFavorite(productId)
            ? AppColors.error
            : AppColors.black,
        backgroundColor: Colors.grey.withOpacity(0.2),
      );
    });
  }
}
