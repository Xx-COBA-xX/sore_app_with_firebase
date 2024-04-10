import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/contianer_widget/rounded_container.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/custom_icon_button.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      itemBuilder: (context, index) {
        return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: isDark ? AppColors.dark : AppColors.grey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Iconsax.ship_copy,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 1.5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Processing",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: AppColors.primary),
                          ),
                          Text(
                            "07 Nov 2024",
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  CustomIconButton(
                    icon: Iconsax.arrow_right_3_copy,
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.tag_copy),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order ID",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "#CDE132",
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.calendar_1_copy),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Data",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "07 Nov 2024",
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
      itemCount: 4,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: TSizes.spaceBtwItems,
        );
      },
    );
  }
}
