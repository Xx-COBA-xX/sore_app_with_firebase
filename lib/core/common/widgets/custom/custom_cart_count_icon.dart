// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/constants/colors.dart';
import 'custom_icon_button.dart';

class TCartCountIcon extends StatelessWidget {
  const TCartCountIcon({
    super.key,
    this.color, this.onPressed,
  });
  final Color? color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomIconButton(
          icon: Iconsax.shopping_bag_copy,
          size: 26,
          color: color,
          onPressed: onPressed,
        ),
        Positioned(
          right: 0,
          top: 5,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: AppColors.black,
            child: Text(
              "2",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: AppColors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
