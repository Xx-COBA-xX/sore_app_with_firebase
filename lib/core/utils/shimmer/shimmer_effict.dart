import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

class TShimmerEffict extends StatelessWidget {
  const TShimmerEffict(
      {super.key,
      required this.height,
      required this.width,
      this.radius = 15,
      this.color});
  final double height, width, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? (isDark ? AppColors.darkerGrey : AppColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
