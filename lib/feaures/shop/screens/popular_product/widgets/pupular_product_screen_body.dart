import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/layout/t_grid_layout.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/product/product_card_viertical.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

class PopularProductScreenBody extends StatelessWidget {
  const PopularProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
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
                onChanged: (e) {}),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TGridLayout(
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) => const TProductCardVertical())
          ],
        ),
      ),
    );
  }
}
