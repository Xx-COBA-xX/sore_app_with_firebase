import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import '../../../utils/constants/sizes.dart';
import 'custom_icon_button.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.showBackArrow = false,
    this.onLeadingIconPressed,
    this.actions,
  });
  final Widget? title;
  final IconData? leadingIcon;
  final bool showBackArrow;
  final VoidCallback? onLeadingIconPressed;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: AppBar(
        title: title,
        leading: showBackArrow
            ? CustomIconButton(
                icon: Iconsax.arrow_left_2_copy,
                color: THelperFunctions.isDarkMode(context)
                    ? AppColors.white
                    : AppColors.dark,
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
                ? CustomIconButton(
                    icon: leadingIcon!,
                    color: THelperFunctions.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.dark,
                    onPressed: onLeadingIconPressed,
                  )
                : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}
