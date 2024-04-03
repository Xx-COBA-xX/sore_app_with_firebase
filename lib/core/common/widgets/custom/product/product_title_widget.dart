// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TProducTItle extends StatelessWidget {
  const TProducTItle({
    super.key,
    required this.title,
    this.smallTitle = false,
    this.textAlign = TextAlign.left, // Add this.,
  });
  final String title;
  final bool smallTitle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallTitle
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
