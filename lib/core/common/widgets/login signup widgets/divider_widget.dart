import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
class TDividerWidget extends StatelessWidget {
  const TDividerWidget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          "Or Sign In with",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
