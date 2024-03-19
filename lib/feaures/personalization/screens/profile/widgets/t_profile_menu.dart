import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/common/widgets/custom/custom_icon_button.dart';
class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.name,
    required this.value,
    this.icon = Iconsax.arrow_right_3_copy,
    this.onPressed,
  });
  final String name;
  final String value;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              )),
          Expanded(
            child: CustomIconButton(
              icon: icon!,
              onPressed: onPressed,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
