// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class CircalerContainer extends StatelessWidget {
  const CircalerContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.child = const SizedBox(),
    this.color = AppColors.textWhite, this.margin,
  });
  final double height;
  final double width;
  final Widget child;
  final Color color;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: color,
      ),
    );
  }
}
