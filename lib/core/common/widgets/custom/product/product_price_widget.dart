import 'package:flutter/material.dart';

class TProductPrice extends StatelessWidget {
  const TProductPrice({
    super.key,
    required this.price,
    this.currentSign = "\$",
    this.isLarge = false,
    this.lineThrough = false,
    this.maxLines = 1,
  });
  final String price;
  final String currentSign;
  final bool isLarge;
  final bool lineThrough;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        currentSign + price,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null,
                ),
      ),
    );
  }
}
