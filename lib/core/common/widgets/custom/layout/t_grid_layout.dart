// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 257,
    required this.itemBuilder,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent),
      itemBuilder: itemBuilder,
    );
  }
}
