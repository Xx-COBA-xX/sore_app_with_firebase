import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/product_details/widgets/product_detalis_body.dart';

import 'widgets/product_button_nav_bar.dart';

class ProdcutDetails extends StatelessWidget {
  const ProdcutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: ProductButtomNavBar(),
        body: ProductDetailsScreenBody(),
      ),
    );
  }
}
