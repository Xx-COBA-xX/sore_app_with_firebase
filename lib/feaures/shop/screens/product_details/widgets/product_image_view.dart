// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/feaures/shop/controller/product/image_controller.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/t_circal_icon.dart';
import '../../../../../core/common/widgets/custom/curved_edge/curved_edge_widget.dart';
import '../../../../../core/utils/constants/colors.dart';
import 'product_image_slider.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    super.key,
    required this.isDark,
    required this.product,
    required this.imageController,
    required this.images,
  });

  final bool isDark;
  final ProductModel product;
  final ImageController imageController;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    imageController.selectImage.value = imageController.getAllProductImages(product).first;
    return TCurvedEdgesWidget(
      child: Container(
        color: isDark ? AppColors.darkerGrey : AppColors.lightGrey,
        child: Stack(
          children: [
            SizedBox(
              height: 350,
              child: Obx(() {
                final image = imageController.selectImage.value;
                return Center(
                    child: CachedNetworkImage(
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ));
              }),
            ),
            //! product image slider
            ProductImageSlider(
              isDark: isDark,
              images: images,
              controller: imageController,
            ),
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircelarIcon(
                  isDark: isDark,
                  iconColor: Colors.red,
                  onPressed: () {},
                  icon: Iconsax.heart,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
