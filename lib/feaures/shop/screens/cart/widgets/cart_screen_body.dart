// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import '../../../../../core/common/widgets/custom/product/cart/cart_item.dart';
import '../../../../../core/common/widgets/custom/product/cart/t_prodcut_quntity_add_remove_btn.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TCartItem(isDark: isDark),
           if(showAddRemoveButton)const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            if(showAddRemoveButton)TProdcutQuantityAndAddRemoveButton(isDark: isDark)
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 3,
    );
  }
}
