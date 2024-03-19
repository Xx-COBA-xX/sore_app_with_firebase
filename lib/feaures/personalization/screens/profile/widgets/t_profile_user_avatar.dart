import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/common/widgets/images/container_image.dart';
import '../../../../../core/utils/constants/images_string.dart';

class TPtofileUserAvatar extends StatelessWidget {
  const TPtofileUserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TRoundedImage(
          imageUrl: TImages.avatar,
          width: 80,
          height: 80,
          borderRadius: 100,
        ),
        Positioned(
          bottom: -10,
          right: -10,
          child: CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Icon(
                  Iconsax.edit_2_copy,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
