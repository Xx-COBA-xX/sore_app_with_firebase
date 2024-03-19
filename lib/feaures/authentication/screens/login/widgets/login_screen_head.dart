import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/images_string.dart';

class TLoginHead extends StatelessWidget {
  const TLoginHead({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          height: 100,
          dark ? TImages.lightLogo : TImages.darkLogo,
        ),
        Text(
          "Welcome back,",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Discover Limitless Choices and Unmatched Convenence.",
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
