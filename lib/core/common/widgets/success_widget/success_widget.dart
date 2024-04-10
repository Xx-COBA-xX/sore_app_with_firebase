// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../core/utils/helpers/helper_func.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subTitle,
    this.onPressed,
  });

  final String title;
  final String subTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              Image.asset(
                width: THelperFunctions.screenWidth() * 0.6,
                TImages.successImage,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: onPressed,
                  child: Text(
                    "Contiune",
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: AppColors.white,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
