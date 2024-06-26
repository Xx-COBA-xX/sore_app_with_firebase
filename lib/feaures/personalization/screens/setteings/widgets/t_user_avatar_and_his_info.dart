import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/common/widgets/effict/shimmer_effict.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/user/user_controller.dart';
import 'package:sore_app_with_firebase/feaures/personalization/screens/profile/profile_screen.dart';
import '../../../../../core/common/widgets/custom/custom_icon_button.dart';
import '../../../../../core/common/widgets/images/container_image.dart';
import '../../../../../core/utils/constants/images_string.dart';

class TUserAvatarAndHisInfo extends StatelessWidget {
  const TUserAvatarAndHisInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.avatar;
        return TRoundedImage(
          isNetworkImage: networkImage.isNotEmpty,
          imageUrl: image,
          width: 45,
          height: 45,
          borderRadius: 100,
        );
      }),
      title: Obx(
        () => controller.profileName.value
            ? const TShimmerEffict(height: 15, width: 80)
            : Text(
                controller.user.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: AppColors.white,
                    ),
              ),
      ),
      subtitle: Obx(
        () => controller.profileName.value
            ? const TShimmerEffict(height: 15, width: 100)
            : Text(
                controller.user.value.email,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: AppColors.white,
                    ),
              ),
      ),
      trailing: CustomIconButton(
        icon: Iconsax.edit_copy,
        color: AppColors.white,
        onPressed: () => Get.to(() => const ProfileScreen(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}
