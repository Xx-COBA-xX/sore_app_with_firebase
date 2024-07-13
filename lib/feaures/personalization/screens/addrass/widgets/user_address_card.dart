// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/address/address_controller.dart';

import 'package:sore_app_with_firebase/feaures/personalization/models/address_model.dart';

import '../../../../../core/common/widgets/custom/contianer_widget/rounded_container.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_func.dart';

class UserAddrassCard extends StatelessWidget {
  const UserAddrassCard({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      final selectedAddressId = controller.selectedAddresses.value.id;
      final selectedAddress = selectedAddressId == address.id;

      return GestureDetector(
        onTap: onTap,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          backgroundColor:
              selectedAddress ? AppColors.primary : Colors.transparent,
          showBorder: true,
          width: double.infinity,
          borderColor: selectedAddress
              ? Colors.transparent
              : isDark
                  ? AppColors.darkerGrey
                  : AppColors.grey,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle : null,
                  color: isDark ? AppColors.white : AppColors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    address.formattedPhone,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    address.toString(),
                    softWrap: true,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
