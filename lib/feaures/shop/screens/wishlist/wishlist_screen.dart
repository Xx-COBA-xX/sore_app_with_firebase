
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/custom_icon_button.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/home/home_screen.dart';

import 'widgets/wishlist_screen_body.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions:  [
          CustomIconButton(icon: Iconsax.add_copy, onPressed: ()=> Get.to(const HomeScreen()))
        ],
      ),
      body: const WishlistScreenBody(),
    );
  }
}
