// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

class UserAddrassScreenBody extends StatelessWidget {
  const UserAddrassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            UserAddrassCard(isSelected: true),
            UserAddrassCard(isSelected: false),
          ],
        ),
      ),
    );
  }
}

class UserAddrassCard extends StatelessWidget {
  const UserAddrassCard({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      backgroundColor: isSelected ? AppColors.primary : Colors.transparent,
      showBorder: true,
      width: double.infinity,
      borderColor: isSelected
          ? Colors.transparent
          : isDark
              ? AppColors.darkerGrey
              : AppColors.grey,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Icon(
              isSelected ? Iconsax.tick_circle : null,
              color: isDark ? AppColors.white : AppColors.black,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Haider Habeeb",
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Text(
                "+964 784 123 4567",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Text(
                "429952 Al-Shraa Street, Abu Al-Khasep, Basrah, IRAQ",
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
