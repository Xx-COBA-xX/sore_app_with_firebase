// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import 'build_payment_price_part.dart';

class TBuildingAmountSection extends StatelessWidget {
  const TBuildingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const TBuildPaymentSectionPricePart(
          title: "Subtotal",
          price: "256.0",
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        const TBuildPaymentSectionPricePart(
          title: "Shipping Fee",
          price: "6.0",
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        const TBuildPaymentSectionPricePart(
          title: "Tax Fee",
          price: "6.0",
        ),
         const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Order Total",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          "\$6.0",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    )
      ],
    );
  }
}

