// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import 't_profile_menu.dart';
import 't_profile_user_avatar.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TPtofileUserAvatar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: "Profile Information",
                    showMore: false,
                    padding: EdgeInsets.zero,
                    textColor: THelperFunctions.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TProfileMenu(
                    name: "Name",
                    value: "Haider Al-Timamy",
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    name: "Username",
                    value: "coba_2003",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSectionHeading(
                    title: "Personal Information",
                    showMore: false,
                    padding: EdgeInsets.zero,
                    textColor: THelperFunctions.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TProfileMenu(
                      name: "User ID",
                      value: "36432",
                      onPressed: () {},
                      icon: Iconsax.copy_copy),
                  TProfileMenu(
                    name: "E-mail",
                    value: "7aider.prog@gmail.com",
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    name: "Phone number",
                    value: "+964 7841392694",
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    name: "Gander",
                    value: "Male",
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    name: "Berth Dara",
                    value: "25 Sep,2003",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


