// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

import '../../../../../core/common/widgets/custom/product/reating_bar_indicator.dart';
import 'overiall_product_reating.dart';
import 'user_review_card.dart';

class ProductReviewesScreenBody extends StatelessWidget {
  const ProductReviewesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Sit back, relax, and enjoy seamless streaming of your favorite content. From blockbuster movies to chart-topping albums, "),
            const SizedBox(height: TSizes.spaceBtwItems),
            const OveriallProductReating(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const ReatingBarIndicator(
              rating: 3.4,
            ),
            Text(
              "12.611",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const UserReivewCard(),
            const UserReivewCard(),
            const UserReivewCard(),
            const UserReivewCard(),
          ],
        ),
      ),
    );
  }
}

