import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/core/common/widgets/success_widget/success_widget.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import '../../../../bottom_nav_bar.dart';
import 'widgets/checkout_screen_body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const CheckOutScreenBody(),
      bottomNavigationBar: Container(
        color: THelperFunctions.isDarkMode(context)
            ? AppColors.dark
            : AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(
                  () => SuccessScreen(
                        title: "Payment Successfully",
                        subTitle:
                            "Your items will shipping soon,\n Thanks for choosing us!",
                        onPressed: () => Get.offAll(() => const BottomNavBar(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 300)),
                      ),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 300)),
              child: const Text("Checkout \$254"),
            ),
          ),
        ),
      ),
    );
  }
}
