import 'package:flutter/material.dart';

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
    this.color, this.padding,
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
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
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
