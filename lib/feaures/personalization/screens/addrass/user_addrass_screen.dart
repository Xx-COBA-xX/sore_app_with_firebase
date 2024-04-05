import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

import 'add_new_addrass_screen.dart';
import 'widgets/user_addrass_screen_body.dart';

class UserAddrassScreen extends StatelessWidget {
  const UserAddrassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        onPressed: () => Get.to(() => const AddNewAddrassScreen()),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Addrasses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const UserAddrassScreenBody(),
    );
  }
}
