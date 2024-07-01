import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';

import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = TSizes.md,
    this.isNetworkImage = false,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.color,
    this.padding,
  });

  final String imageUrl;
  final double borderRadius;
  final bool isNetworkImage;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: fit,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const TShimmerEffict(height: 55, width: 55),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image.asset(
                imageUrl,
                fit: fit,
              ),
      ),
    );
  }
}
