import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  final Rx<String> selectImage = "".obs;

  List<String> getAllProductImages(ProductModel product) {
    final List<String> images = [];

    images.add(product.thumbnail);
    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((e) => e.image));
    }

    return images;
  }

  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(
                imageUrl: image,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text("Close")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
