import 'package:flutter/widgets.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffict(height: 110, width: 150)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffict(height: 110, width: 150)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffict(height: 110, width: 150)),
          ],
        )
      ],
    );
  }
}
