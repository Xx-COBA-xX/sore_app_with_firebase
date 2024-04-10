import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';

import 'widgets/sub_categories_screen_body.dart';

class SubCategorieScreen extends StatelessWidget {
  const SubCategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Sport",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SubCategorieScreenBody(),
    );
  }
}
