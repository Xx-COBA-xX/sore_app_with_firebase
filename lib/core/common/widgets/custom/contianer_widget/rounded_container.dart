import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.height,
    this.reduis = TSizes.cardRadiusLg,
    this.borderColor = AppColors.borderPrimary,
    this.backgroundColor = AppColors.white,
    this.showBorder = false,
    this.padding,
    this.margin,
    this.child,
    this.width,
  });

  final double? width, height;
  final double reduis;
  final Color borderColor;
  final Color backgroundColor;
  final bool showBorder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: showBorder ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.circular(reduis)),
      child: child,
    );
  }
}
