import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
                icon: Iconsax.shopping_bag_copy,
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
                ? CustomIconButton(
                    icon: leadingIcon!,
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
