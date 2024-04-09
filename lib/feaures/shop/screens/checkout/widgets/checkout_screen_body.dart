import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/cart/widgets/cart_screen_body.dart';

import '../../../../../core/common/widgets/custom/product/cart/copon_code_widget.dart';
import '../../../../../core/utils/constants/colors.dart';
import 'build_amount_section.dart';
import 'build_shipping-address_section.dart';
import 'building_payment_section.dart';

class CheckOutScreenBody extends StatelessWidget {
  const CheckOutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            const CartScreenBody(
              showAddRemoveButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const TCoponeCode(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: isDark ? AppColors.dark : AppColors.white,
              showBorder: true,
              child: const Column(
                children: [
                  //? Pricing
                  TBuildingAmountSection(),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  //! Divider
                  Divider(),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  //* Payment Methode
                  TBuildingPaymentSection(),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  //* Shipping Address
                  TBuildingShippingAddressSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
