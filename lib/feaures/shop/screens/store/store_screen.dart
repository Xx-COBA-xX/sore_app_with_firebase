// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

import '../../../../core/common/widgets/custom/custom_cart_count_icon.dart';
import '../../../../core/utils/helpers/helper_func.dart';
import 'widgets/store_screen_body.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
        final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Sotre",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCartCountIcon(
            color: isDark ? AppColors.white : AppColors.black,
          ),
        ],
      ),
      body: const StoreScreenBody(),
    );
  }
}
