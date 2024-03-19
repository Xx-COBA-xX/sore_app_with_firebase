import 'package:flutter/cupertino.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.size = TSizes.iconMd,
    this.color = AppColors.white,
  });
  final VoidCallback? onPressed;
  final IconData icon;
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
