// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/layout/t_grid_layout.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_card_viertical.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/prodcut/pruduct_model.dart';

import '../../../controller/product/all_product_controller.dart';

class TSortbalProducts extends StatelessWidget {
  const TSortbalProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put((AllProductController()));
    controller.assginProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration:
              const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Popularity"
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (e) {
            controller.sortProducts(e!);
          },
          value: controller.sortOption.value,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Obx(() {
          return TGridLayout(
            padding: EdgeInsets.zero,
            itemCount: controller.products.length,
            itemBuilder: (context, index) => TProductCardVertical(
              product: controller.products[index],
            ),
          );
        })
      ],
    );
  }
}
