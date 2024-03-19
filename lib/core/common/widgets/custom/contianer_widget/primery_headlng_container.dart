import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edge/curved_edge_widget.dart';
import 'circaler_container.dart';

class ContainerWithCurvedEdge extends StatelessWidget {
  const ContainerWithCurvedEdge({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              right: -250,
              top: -150,
              child: CircalerContainer(
                color: AppColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              right: -300,
              top: 50,
              child: CircalerContainer(
                color: AppColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
