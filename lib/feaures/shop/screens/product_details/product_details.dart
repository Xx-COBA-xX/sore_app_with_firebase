// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sore_app_with_firebase/feaures/shop/screens/product_details/widgets/product_detalis_body.dart';

import '../../models/prodcut/pruduct_model.dart';
import 'widgets/product_button_nav_bar.dart';

class ProdcutDetails extends StatelessWidget {
  const ProdcutDetails({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        bottomNavigationBar: const ProductButtomNavBar(),
        body: ProductDetailsScreenBody(
          product: productModel,
        ),
      ),
    );
  }
}
