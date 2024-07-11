// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/categories/categories_model.dart';

import 'widgets/sub_categories_screen_body.dart';

class SubCategorieScreen extends StatelessWidget {
  const SubCategorieScreen({
    super.key,
    required this.category,
  });

  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SubCategorieScreenBody(
        category: category,
      ),
    );
  }
}
