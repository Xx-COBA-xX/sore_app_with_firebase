import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/custom_icon_button.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

class ProductRaitingAndShare extends StatelessWidget {
  const ProductRaitingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star,
              color: Colors.amber,
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "5.4",
                      style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: " (199)")
                ],
              ),
            )
          ],
        ),
        CustomIconButton(
          icon: Icons.share,
          onPressed: () {},
        )
      ],
    );
  }
}
