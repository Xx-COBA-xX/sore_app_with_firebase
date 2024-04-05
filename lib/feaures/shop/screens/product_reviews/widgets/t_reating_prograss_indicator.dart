import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';

class TReatingPrograssIndicator extends StatelessWidget {
  const TReatingPrograssIndicator({
    super.key,
    required this.value,
    required this.text,
  });
  final double value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            )),
        Expanded(
          flex: 11,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            borderRadius: BorderRadius.circular(13),
            backgroundColor: AppColors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        )
      ],
    );
  }
}
