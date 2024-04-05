import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';

import 'widgets/product_reviewes_screen_body.dart';

class ProductReviewesScreen extends StatelessWidget {
  const ProductReviewesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Reviews & Reating",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const ProductReviewesScreenBody(),
    );
  }
}
