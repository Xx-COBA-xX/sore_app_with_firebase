import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';

class SignupAgreeCheckBox extends StatelessWidget {
  const SignupAgreeCheckBox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 26,
          width: 26,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "I agree to ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "Privacy Policy",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? AppColors.white : AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? AppColors.white : AppColors.primary,
                    ),
              ),
              TextSpan(
                text: " and ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "Privacy Policy",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? AppColors.white : AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? AppColors.white : AppColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

