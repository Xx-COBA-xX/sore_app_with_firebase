import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utils.dart';
import '../../../../utils/helpers/helper_func.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.showBorder,
    required this.text,
    this.icon = Iconsax.search_normal_copy,
    this.onTap,
    required this.showBarckgound,
    this.padding = const EdgeInsets.symmetric(
      horizontal: TSizes.defaultSpace,
    ),
  });
  final bool showBarckgound, showBorder;
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding!,
        child: Container(
          padding: const EdgeInsets.all(TSizes.md - 4),
          width: TDeviceUtils.getScreenWidth(context),
          decoration: BoxDecoration(
            color: showBarckgound
                ? dark
                    ? AppColors.dark
                    : AppColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: AppColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.darkGrey,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
