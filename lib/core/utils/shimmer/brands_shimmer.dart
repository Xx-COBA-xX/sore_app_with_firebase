import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';

import '../../common/widgets/custom/layout/t_grid_layout.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 70,
      itemCount: 4,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) =>
          GestureDetector(child: const TShimmerEffict(height: 40, width: 70)),
    );
  }
}
