import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';

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
