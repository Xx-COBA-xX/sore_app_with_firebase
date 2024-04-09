// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:sore_app_with_firebase/core/common/widgets/custom/section_heading.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class TBuildingShippingAddressSection extends StatelessWidget {
  const TBuildingShippingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          onPressed: () {},
          title: "Shipping Address",
          showMore: true,
          btnText: "Change",
          padding: EdgeInsets.zero,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Text(
          "Haider H. Al-Timamy",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        const TBuildAddrassItem(
          icon: Icons.phone,
          text: "+964 784-139-2694",
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        const TBuildAddrassItem(
          icon: Iconsax.location_copy,
          text: "Abo Al-Khasib,Basrah 11223, IRAQ ",
        ),
      ],
    );
  }
}

class TBuildAddrassItem extends StatelessWidget {
  const TBuildAddrassItem({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems / 2,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
