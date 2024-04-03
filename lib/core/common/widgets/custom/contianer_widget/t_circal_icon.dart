import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TCircelarIcon extends StatelessWidget {
  const TCircelarIcon({
    super.key,
    required this.isDark,
    this.height = 40,
    this.width = 40,
    this.backgroundColor,
    this.redius = 100,
    this.icon,
    this.iconColor,
    this.iconSize = TSizes.iconMd ,
    this.onPressed,
  });

  final bool isDark;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? redius;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.only(right: TSizes.sm),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(redius!),
          color: backgroundColor ??
              (isDark
                  ? AppColors.black.withOpacity(0.9)
                  : AppColors.white.withOpacity(.9)),
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
