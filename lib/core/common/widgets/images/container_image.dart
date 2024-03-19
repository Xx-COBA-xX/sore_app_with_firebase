import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = TSizes.md,
    this.isNetworkImage = false,
    this.fit = BoxFit.contain, this.width, this.height,
  });

  final String imageUrl;
  final double borderRadius;
  final bool isNetworkImage;
  final BoxFit? fit;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: isNetworkImage
            ? Image.network(
                imageUrl,
                fit: fit,
              )
            : Image.asset(
                imageUrl,
                fit: fit,
              ),
      ),
    );
  }
}
