// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

import '../../../utils/constants/sizes.dart';

class TCircalrImage extends StatelessWidget {
  const TCircalrImage({
    super.key,
    required this.isDark,
    this.imageColor,
    this.bacgroundColor,
    this.padding = TSizes.sm,
    this.fit = BoxFit.cover,
    this.isNetworkImage,
    required this.image,
    this.height = 56,
    this.width = 56,
  });

  final bool isDark;
  final Color? imageColor;
  final Color? bacgroundColor;
  final double? height, width, padding;
  final BoxFit? fit;
  final bool? isNetworkImage;
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
      child: Image(
        image: isNetworkImage!
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        fit: fit,
        color: imageColor,
      ),
    );
  }
}
