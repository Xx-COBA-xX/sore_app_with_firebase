import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/network/network_manager.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/data/user/user_repositry.dart';
import 'package:sore_app_with_firebase/feaures/authentication/models/user/user_model.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/user/user_controller.dart';

import '../../screens/profile/profile_screen.dart';

class ChangeNameController extends GetxController {
  ChangeNameController get instance => Get.find();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final GlobalKey<FormState> changeNameKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final UserRepository userRepository = UserRepository.instance;
  @override
  onInit() {
    super.onInit();
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  void changeName() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "Changing name...", TImages.loaderAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // validate the first name and last name
      if (!changeNameKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final Map<String, dynamic> json = {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
      };
      await userRepository.updateSingleFelid(json);

      userController.user.value = UserModel(
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: userController.user.value.email,
          phoneNumber: userController.user.value.phoneNumber,
          username: userController.user.value.username,
          profilePicture: userController.user.value.profilePicture,
          uid: userController.user.value.uid);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: "Gongratulations", message: "Your name has besn change");
      Get.off(()=> const ProfileScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
