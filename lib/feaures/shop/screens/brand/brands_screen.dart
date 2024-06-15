import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';

import 'brands_screen_body.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "All Brands",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const AllBrandsScreenBody(),
    );
  }
}
