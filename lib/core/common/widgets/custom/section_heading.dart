// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.textColor = AppColors.white,
    required this.showMore,
    this.btnText = "Show More",
    this.padding = const EdgeInsets.symmetric(
      horizontal: TSizes.defaultSpace,
    ),
    this.onPressed,
  });

  final String title;
  final Color textColor;
  final bool showMore;
  final String btnText;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
          ),
          
          if (showMore)
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              child: Text(
                btnText,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
        ],
      ),
    );
  }
}
