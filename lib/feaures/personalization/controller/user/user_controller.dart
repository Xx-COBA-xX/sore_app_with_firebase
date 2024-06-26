import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/network/network_manager.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/data/repository/authentication/auth_repositry.dart';
import 'package:sore_app_with_firebase/feaures/authentication/models/user/user_model.dart';
import 'package:sore_app_with_firebase/feaures/authentication/screens/login/login_screen.dart';

import '../../../../data/user/user_repositry.dart';
import '../../screens/profile/widgets/re_authenticon_login_screen.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final UserRepository userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> profileName = false.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> saveRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final fullName =
            UserModel.namePars(userCredential.user?.displayName ?? " ");
        final username = UserModel.generateUsername(fullName);
        final user = UserModel(
            firstName: fullName[0],
            lastName: fullName.length > 1 ? fullName.sublist(1).join(" ") : " ",
            email: userCredential.user?.email ?? " ",
            phoneNumber: userCredential.user?.phoneNumber ?? " ",
            username: username,
            profilePicture: userCredential.user?.photoURL ?? " ",
            uid: userCredential.user?.uid ?? " ");

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Data not saved",
          message:
              "Some thing was worng to save your information, You can re-save your data in your profilo");
    }
  }

  deleteAccountWarningPopup() {
    return Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action not available and all your data will be removed permanently",
      confirm: ElevatedButton(
        onPressed: ()=>  deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("Delete"),
      ),
      cancel: ElevatedButton(
        onPressed: Get.back,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          side: const BorderSide(color: Colors.grey),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("Cancel"),
      ),
    );
  }

  deleteUserAccount() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "Processing...", TImages.loaderAnimation);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          TFullScreenLoader.stopLoading();
          Get.to(const ReAuthLoginScreen());
        } 
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }

  reAuthenticationEmailAndPassword() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "Processoing...", TImages.loaderAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticationEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }

  void fetchUserRecord() async {
    try {
      profileName.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileName.value = false;
    }
  }

  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageUrl = await userRepository.uploadProfileImage(
            path: "User/Image/Profile", image: image);

        Map<String, dynamic> json = {"profilePicture": image.path};
        await userRepository.updateSingleFelid(json);

        user.value = UserModel(
          firstName: user.value.firstName,
          lastName: user.value.lastName,
          email: user.value.email,
          phoneNumber: user.value.phoneNumber,
          username: user.value.username,
          profilePicture: imageUrl,
          uid: user.value.uid,
        );
      }
      TLoaders.errorSnackBar(
          title: "Congratulations",
          message: "Your profile picture has been updated");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
