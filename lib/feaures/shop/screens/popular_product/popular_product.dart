import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/product_shimmer.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../controller/product/all_product_controller.dart';
import 'widgets/pupular_product_screen_body.dart';

class PopularProductScreen extends StatelessWidget {
  const PopularProductScreen(
      {super.key, required this.title, this.query, this.fetchMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? fetchMethod;
  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: fetchMethod ?? controller.fetchProductsByQuery(query!),
              builder: (context, snapshot) {
                const loader = ProductShimmer(itemCount: 6);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text("No Data Found"));
                }

                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong :("));
                }
                final products = snapshot.data! as List<ProductModel>;

                return TSortbalProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
