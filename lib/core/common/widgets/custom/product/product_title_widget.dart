// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

class TProducTitle extends StatelessWidget {
  const TProducTitle({
    super.key,
    required this.title,
    this.smallTitle = false,
    this.textAlign = TextAlign.left, // Add this.,
     this.maxLine = 2,
  });
  final String title;
  final bool smallTitle;
  final TextAlign? textAlign;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.xs),
      child: Text(
        title,
        style: smallTitle
            ? Theme.of(context).textTheme.labelLarge
            : Theme.of(context).textTheme.titleSmall,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      ),
    );
  }
}
