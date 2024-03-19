import 'package:flutter/material.dart';


class TProducTItle extends StatelessWidget {
  const TProducTItle({
    super.key,
    required this.title,
    this.smallTitle = false,
  });
  final String title;
  final bool smallTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallTitle
          ? Theme.of(context).textTheme.bodyLarge
          : Theme.of(context).textTheme.titleSmall,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
    );
  }
}

