import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

class TAnimatedLoader extends StatelessWidget {
  const TAnimatedLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    required this.actionText,
    this.actionOnPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String actionText;
  final VoidCallback? actionOnPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: actionOnPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.dark),
                    child: Text(
                      actionText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: AppColors.light),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
