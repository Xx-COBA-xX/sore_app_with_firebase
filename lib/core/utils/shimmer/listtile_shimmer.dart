import 'package:flutter/widgets.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/shimmer/shimmer_effict.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffict(
              height: 50,
              width: 50,
              radius: 50,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffict(
                  height: 15,
                  width: 100,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                TShimmerEffict(
                  height: 15,
                  width: 50,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
