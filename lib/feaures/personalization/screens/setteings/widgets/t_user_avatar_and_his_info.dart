import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/personalization/screens/profile/profile_screen.dart';
import '../../../../../core/common/widgets/custom/custom_icon_button.dart';
import '../../../../../core/utils/constants/images_string.dart';

class TUserAvatarAndHisInfo extends StatelessWidget {
  const TUserAvatarAndHisInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(TImages.avatar),
      ),
      title: Text("Haider AL-Timamy",
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: AppColors.white,
              )),
      subtitle: Text("coba@gmail.com",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                color: AppColors.white,
              )),
      trailing: CustomIconButton(
        icon: Iconsax.edit_copy,
        color: AppColors.white,
        onPressed: () => Get.to(() => const ProfileScreen(), transition: Transition.fade, duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}
