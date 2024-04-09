// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/primery_headlng_container.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/personalization/screens/addrass/user_addrass_screen.dart';

import '../../../../../core/common/widgets/custom/list_tile/t_settins_menu_title.dart';
import 't_user_avatar_and_his_info.dart';

class SetteingScreenBody extends StatelessWidget {
  const SetteingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ContainerWithCurvedEdge(
            child: Column(
              children: [
                TAppBar(
                  title: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.headlineMedium!.apply(
                          color: AppColors.white,
                        ),
                  ),
                ),
                const TUserAvatarAndHisInfo(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TSectionHeading(
                    title: "Account Settings",
                    showMore: false,
                    textColor: isDark ? AppColors.white : AppColors.dark),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSetteingMenuTile(
                  title: "My Addresse",
                  subTitle: "Set shopping delivery address",
                  icon: Iconsax.safe_home_copy,
                  onTap: () => Get.to(() => const UserAddrassScreen()),
                ),
                const TSetteingMenuTile(
                    title: "My Cart",
                    subTitle: "Add, remove products and move to checkout",
                    icon: Iconsax.shopping_cart_copy),
                const TSetteingMenuTile(
                    title: "My Orders",
                    subTitle: "Track, return, or buy again",
                    icon: Iconsax.bag_tick_copy),
                const TSetteingMenuTile(
                    title: "Bank Account",
                    subTitle: "Withdraw balance to registred bank account",
                    icon: Iconsax.bank_copy),
                const TSetteingMenuTile(
                    title: "My Coupons",
                    subTitle: "List of all the discounted coupons",
                    icon: Iconsax.discount_shape_copy),
                const TSetteingMenuTile(
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                    icon: Iconsax.notification_copy),
                const TSetteingMenuTile(
                    title: "Account Privacy",
                    subTitle: "Manage data usage and cnnected accounts",
                    icon: Iconsax.security_card_copy),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSectionHeading(
                  title: "App Settings",
                  showMore: false,
                  textColor: isDark ? AppColors.white : AppColors.dark,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSetteingMenuTile(
                    title: "Load Data",
                    subTitle: "Upload data to your cloud Firebas",
                    icon: Iconsax.document_upload_copy),
                TSetteingMenuTile(
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    icon: Iconsax.location_copy,
                    trailing: Switch(value: true, onChanged: (value) {})),
                TSetteingMenuTile(
                    title: "Safe Mode",
                    subTitle: "Search result is safe for all ages",
                    icon: Iconsax.security_user_copy,
                    trailing: Switch(value: false, onChanged: (value) {})),
                TSetteingMenuTile(
                    title: "HD Image Quality",
                    subTitle: "Set image quality to be seem",
                    icon: Iconsax.image_copy,
                    trailing: Switch(value: true, onChanged: (value) {})),
              ],
            ),
          )
        ],
      ),
    );
  }
}
