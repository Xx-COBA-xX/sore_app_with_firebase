// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';

class ReatingBarIndicator extends StatelessWidget {
  const ReatingBarIndicator({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      itemSize: 16,
      rating: rating,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
      unratedColor: AppColors.lightGrey,
      itemBuilder: (_, __) => const Icon(
        Icons.star_rate_rounded,
        color: AppColors.primary,
      ),
    );
  }
}
