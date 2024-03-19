import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/enums.dart';

import '../../../../utils/constants/sizes.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    this.maxLine = 1,
    required this.iconColor,
    this.textSizes = TextSizes.medium,
  });
  final String title;
  final int? maxLine;
  final Color iconColor;
  final TextSizes? textSizes;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: textSizes == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium
              : textSizes == TextSizes.medium
                  ? Theme.of(context).textTheme.bodyLarge
                  : textSizes == TextSizes.large
                      ? Theme.of(context).textTheme.titleLarge
                      : Theme.of(context).textTheme.bodyLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLine,
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify,
          size: TSizes.iconSm,
          color: iconColor,
        ),
      ],
    );
  }
}
