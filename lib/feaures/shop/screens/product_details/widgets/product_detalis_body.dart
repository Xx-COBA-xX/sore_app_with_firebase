import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/product_details/product_details.dart';

class ProdcutDetails extends StatelessWidget {
  const ProdcutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: ProductDetailsScreenBody(),
    ));
  }
}
