import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../contianer_widget/rounded_container.dart';

class TCoponeCode extends StatelessWidget {
  const TCoponeCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.only(
        right: TSizes.sm,
        bottom: TSizes.sm - 2,
        top: TSizes.sm - 2,
      ),
      backgroundColor: isDark ? AppColors.dark : AppColors.white,
      showBorder: true,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                hintStyle: Theme.of(context).textTheme.labelLarge,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.grey.withOpacity(0.2),
                foregroundColor: isDark
                    ? AppColors.white.withOpacity(0.5)
                    : AppColors.dark.withOpacity(0.5),
                side: BorderSide(
                  color: AppColors.grey.withOpacity(0.1),
                ),
              ),
              onPressed: () {},
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
