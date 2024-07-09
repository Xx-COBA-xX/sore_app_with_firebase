// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/shimmer/shimmer_effict.dart';

class TCircalrImage extends StatelessWidget {
  const TCircalrImage({
    super.key,
    required this.isDark,
    this.imageColor,
    this.bacgroundColor,
    this.padding = TSizes.sm,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    required this.image,
    this.height = 56,
    this.width = 56,
  });

  final bool isDark;
  final Color? imageColor;
  final Color? bacgroundColor;
  final double? height, width, padding;
  final BoxFit? fit;
  final bool isNetworkImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        color: bacgroundColor ?? (isDark ? AppColors.black : AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: isNetworkImage
          ? CachedNetworkImage(
              width: width,
              imageUrl: image,
              fit: fit,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const TShimmerEffict(height: 170, width: double.infinity),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              color: imageColor,
            )
          : Image.asset(
              TImages.avatar,
              fit: fit,
            ),
    );
  }
}
