import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_func.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tabs,
  });
  final List<Tab> tabs;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Material(
      color: isDark ? AppColors.black : AppColors.white,
      child: TabBar(
        unselectedLabelColor: AppColors.darkGrey,
        physics: const BouncingScrollPhysics(),
        tabAlignment: TabAlignment.center,
        isScrollable: true,
        labelColor: AppColors.primary,
        indicatorColor: AppColors.primary,
        dividerColor: isDark ? AppColors.black : AppColors.white,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}
